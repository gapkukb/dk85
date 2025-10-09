import 'dart:convert';
import 'dart:io';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:victory/shared/dialogs/dialog.dart';
import 'package:victory/shared/talker/talker.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:image_picker/image_picker.dart' as image_picker;
import 'package:file_picker/file_picker.dart' as file_picker;
import 'package:image/image.dart' as image;

mixin WebviewMixin {
  void Function()? closeLoadingBar;
  late final WebViewController webview;
  final ValueNotifier<double> _progress = ValueNotifier<double>(0.0);

  void ensureInitialized({bool showLoading = true}) {
    late final PlatformWebViewControllerCreationParams params;
    // 设置 Android 的 WebViewController
    if (WebViewPlatform.instance is AndroidWebViewPlatform) {
      params = AndroidWebViewControllerCreationParams();
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    webview = WebViewController.fromPlatformCreationParams(params)
      ..enableZoom(false)
      ..setJavaScriptMode(JavaScriptMode.unrestricted);

    if (webview.platform is AndroidWebViewController) {
      AndroidWebViewController androidController = webview.platform as AndroidWebViewController;
      // 讓安卓webview支持文件選擇,ios默認支持
      androidController.setOnShowFileSelector(_androidFilePicker);
    }

    if (showLoading) {
      _showLoadingBar();
    }

    _preprocess();
  }

  void _interruptFullscreen() {
    webview.runJavaScript('''
      Element.prototype.requestFullscreen = function() {
        console.log("已拦截 requestFullscreen 调用");
        return Promise.reject(new Error("全屏已被拦截"));
      };

      ['fullscreenchange', 'webkitfullscreenchange', 'mozfullscreenchange', 'msfullscreenchange'].forEach(event => {
        document.addEventListener(event, () => {
          if (
            document.fullscreenElement ||
            document.webkitFullscreenElement ||
            document.mozFullScreenElement ||
            document.msFullscreenElement
          ) {
            if (document.exitFullscreen) document.exitFullscreen();
            else if (document.webkitExitFullscreen) document.webkitExitFullscreen();
            else if (document.mozCancelFullScreen) document.mozCancelFullScreen();
            else if (document.msExitFullscreen) document.msExitFullscreen();
          }
        });
      });
    ''');
  }

  void _injectAppSignal() {
    webview.runJavaScript('''window.inJApp = true;''');
  }

  Future<List<String>> _androidFilePicker(FileSelectorParams params) async {
    if (params.acceptTypes.any((type) => type.startsWith('image/'))) return _androidImagePicker(params);
    return _androidAnyFilePicker(params);
  }

  Future<List<String>> _androidAnyFilePicker(FileSelectorParams params) async {
    final result = await file_picker.FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: file_picker.FileType.any,
    );

    if (result != null) {
      return result.paths.whereType<String>().map((path) => File(path).uri.toString()).toList();
    }
    return [];
  }

  Future<List<String>> _androidImagePicker(FileSelectorParams params) async {
    if (params.acceptTypes.any((type) => type == 'image/*')) {
      final picker = image_picker.ImagePicker();
      final photo = await picker.pickImage(source: image_picker.ImageSource.camera);

      if (photo == null) {
        return [];
      }

      final imageData = await photo.readAsBytes();
      final decodedImage = image.decodeImage(imageData)!;
      final scaledImage = image.copyResize(decodedImage, width: 500);
      final jpg = image.encodeJpg(scaledImage, quality: 90);

      final filePath = (await getTemporaryDirectory()).uri.resolve(
        './image_${DateTime.now().microsecondsSinceEpoch}.jpg',
      );
      final file = await File.fromUri(filePath).create(recursive: true);
      await file.writeAsBytes(jpg, flush: true);

      return [file.uri.toString()];
    }

    return [];
  }

  void postMessage(WebviewMessage message) {
    /// js需要如下监听事件
    /// window.addEventListener('message', (event) => {
    //    console.log('收到Flutter消息:', event.detail);
    //  });
    ///
    final script =
        """
      window.dispatchEvent(new MessageEvent('message', {
        data: ${jsonEncode(message.toJson())},
        origin: '*',
        source: window
      }));
      """;
    webview.runJavaScript(script);
  }

  void onMessage(void Function(WebviewMessage message) callback) {
    webview.addJavaScriptChannel(
      'VictoryApp',
      onMessageReceived: (message) {
        // toast(message.message);
        callback(WebviewMessage.fromJsonString(message.message));
      },
    );
  }

  void _showLoadingBar() {
    closeLoadingBar = BotToast.showEnhancedWidget(
      toastBuilder: (cancelFunc) {
        return ValueListenableBuilder<double>(
          valueListenable: _progress,
          builder: (BuildContext context, value, child) {
            return Transform.translate(
              offset: Offset(0, MediaQuery.of(context).padding.top),
              child: LinearProgressIndicator(
                backgroundColor: Colors.grey,
                color: Colors.blue,
                value: value,
                minHeight: 4,
              ),
            );
          },
        );
      },
    );
  }

  void _preprocess() {
    webview.setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          _progress.value = progress / 100;
        },
        onPageStarted: (String url) {
          _injectAppSignal();
          _interruptFullscreen();
        },
        onPageFinished: (String url) {
          _injectAppSignal();
          closeLoadingBar?.call();
        },
        onHttpError: (HttpResponseError error) {},
        onWebResourceError: (WebResourceError error) {
          talker.error('WebView error: ${error.description}');
        },
      ),
    );
  }

  Widget get backButton {
    return Transform.translate(
      offset: const Offset(0, 6),
      child: Builder(
        builder: (context) {
          final landscape = MediaQuery.of(context).orientation == Orientation.landscape;
          return GestureDetector(
            onTap: askExit,
            child: SizedBox.square(dimension: landscape ? 16 : 36, child: Image.asset('assets/icons/back-icon.webp')),
          );
        },
      ),
    );
  }

  void askExit() {
    VicDialog.confirm(
      content: 'app.exit'.tr,
      onConfirm: Get.back,
    );
  }

  clearWebview() {
    closeLoadingBar?.call();
    _progress.dispose();
  }
}

enum WebviewMessageType {
  normal,
}

class WebviewMessage {
  final String from;
  final int type;
  final Object data;

  WebviewMessage({required this.data, required this.type, this.from = 'VicApp'});

  factory WebviewMessage.fromJsonString(String source) {
    final json = jsonDecode(source);
    return WebviewMessage(data: json['data'] as Object, type: json['type'] as int, from: json['from'] as String);
  }

  Map<String, dynamic> toJson() => {
    "from": from,
    "type": type,
    "data": jsonEncode(data),
  };
}
