import 'dart:convert';
import 'package:bot_toast/bot_toast.dart';
import 'package:draggable_float_widget/draggable_float_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:victory/mixins/file_picker.mixin.dart';
import 'package:victory/shared/dialogs/dialog.dart';
import 'package:victory/shared/talker/talker.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';

class _WebviewMixin {
  static bool _first = true;
  void Function()? closeLoadingBar;
  late final WebViewController controller;
  final ValueNotifier<double> _progress = ValueNotifier<double>(0.0);
  final picker = FilePicker();

  void ensureInitialized({bool showLoading = true}) {
    late final PlatformWebViewControllerCreationParams params;
    // 设置 Android 的 WebViewController
    if (WebViewPlatform.instance is AndroidWebViewPlatform) {
      params = AndroidWebViewControllerCreationParams();
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    controller = WebViewController.fromPlatformCreationParams(params)
      ..enableZoom(false)
      ..setJavaScriptMode(JavaScriptMode.unrestricted);

    if (_first) {
      controller.clearCache();
      _first = false;
    }

    if (controller.platform is AndroidWebViewController) {
      AndroidWebViewController androidController = controller.platform as AndroidWebViewController;
      // 讓安卓webview支持文件選擇,ios默認支持
      androidController.setOnShowFileSelector(_androidFilePicker);
      if (androidController.supportsSetScrollBarsEnabled()) {
        androidController.setVerticalScrollBarEnabled(false);
        androidController.setHorizontalScrollBarEnabled(false);
      }
    }

    if (showLoading) {
      _showLoadingBar();
    }

    _preprocess();
  }

  void _interruptFullscreen() {
    final css = '''
      var style = document.createElement('style');
      style.type = 'text/css';
      style.innerHTML = '::-webkit-scrollbar { display: none; } body { -ms-overflow-style: none; scrollbar-width: none; }';
      document.head.appendChild(style);
    ''';

    controller.runJavaScript(css);
    controller.runJavaScript('''
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
    controller.runJavaScript('''window.inJApp = true;''');
  }

  Future<List<String>> _androidFilePicker(FileSelectorParams params) async {
    // if (params.acceptTypes.any((type) => type.startsWith('image/'))) return _androidImagePicker(params);
    return await picker.showPickerOptions();
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
    controller.runJavaScript(script);
  }

  void onMessage(void Function(WebviewMessage message) callback) {
    controller.addJavaScriptChannel(
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
    controller.setNavigationDelegate(
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

  Widget backButton({
    String? message,
    double borderLeft = 18,
    double borderTop = 12,
    double borderRight = 12,
    VoidCallback? onBack,
  }) {
    return DraggableFloatWidget(
      width: 36,
      height: 36,
      config: DraggableFloatWidgetBaseConfig(
        initPositionXInLeft: true,
        initPositionYInTop: true,
        borderLeft: borderLeft,
        borderTop: borderTop,
        borderRight: borderRight,
        initPositionYMarginBorder: 0,
      ),
      onTap: onBack,
      child: Image.asset(
        'assets/icons/back-icon.webp',
        fit: BoxFit.fill,
      ),
    );
  }

  Future askExit({
    String? message,
    VoidCallback? onConfirm,
  }) {
    return VicDialog.confirm(
      content: message ?? 'app.exit'.tr,
      onConfirm: () {
        onConfirm?.call();
        Get.back();
      },
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

mixin WebviewMixin {
  final webview = _WebviewMixin();
}
