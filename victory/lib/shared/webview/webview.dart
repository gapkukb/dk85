import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:victory/services/services.dart';
import 'package:victory/theme/theme.dart';
import 'package:victory/shared/dialogs/dialog.dart';

part 'interrupt_fullscreen.dart';

class VicWebview extends StatefulWidget {
  final bool pauseAudio;
  final bool allowFullscreen;
  final bool cacheable;
  final bool showScorllbar;
  final bool backButton;
  final bool lockPortrait;
  final String? url;
  final String? content;
  const VicWebview({
    super.key,
    this.url,
    this.allowFullscreen = false,
    this.cacheable = true,
    this.showScorllbar = true,
    this.backButton = false,
    this.pauseAudio = false,
    this.lockPortrait = true,
    this.content,
  }) : assert(url != null || content != null, 'url和content不得同时为空');

  @override
  _VicWebviewState createState() => _VicWebviewState();
}

class _VicWebviewState extends State<VicWebview> {
  late final WebViewController controller;

  @override
  void initState() {
    if (!widget.lockPortrait) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    }
    _initilize();

    if (widget.pauseAudio) {
      services.app.pauseAudio();
    }
    if (widget.content == null) {
      controller.loadRequest(Uri.parse(widget.url!));
    } else {
      // controller.loadHtmlString(widget.content!);
      controller.loadHtmlString(widget.content!);
      controller.setBackgroundColor(AppColors.background);
    }
    super.initState();
  }

  @override
  void dispose() {
    if (widget.pauseAudio) {
      services.app.resumeAudio();
    }
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: !widget.backButton,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        askExit();
      },
      child: Scaffold(
        floatingActionButton: widget.backButton
            ? Transform.translate(
                offset: const Offset(0, 12),
                child: FloatingActionButton.small(
                  heroTag: 'gaming',
                  onPressed: askExit,
                  backgroundColor: Colors.transparent,
                  child: Image.asset('assets/icons/back-icon.webp'),
                ),
              )
            : null,
        floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
        body: Scaffold(body: WebViewWidget(controller: controller)),
      ),
    );
  }

  askExit() async {
    VicDialog.confirm(
      content: 'app.exit'.tr,
      onConfirm: Get.back,
    );
  }

  _initilize() {
    controller = WebViewController()
      ..enableZoom(false)
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      // ..clearLocalStorage()
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {
            _injectAppSignal();
            _interruptFullscreen();
          },
          onPageFinished: (String url) {},
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
          // onNavigationRequest: (NavigationRequest request) {
          //   if (request.url.startsWith('https://www.youtube.com/')) {
          //     return NavigationDecision.prevent;
          //   }
          //   return NavigationDecision.navigate;
          // },
        ),
      );

    // if (!widget.cacheable) {
    //   controller.clearCache();
    // }

    if (!widget.showScorllbar) {
      controller
        ..setHorizontalScrollBarEnabled(false)
        ..setVerticalScrollBarEnabled(false);
    }
  }

  _interruptFullscreen() {
    if (!widget.allowFullscreen) {
      controller.runJavaScript(_interruptFullscreenScript);
    }
  }

  _injectAppSignal() {
    controller.runJavaScript("window.__JJJ_APP__=true;");
  }
}
