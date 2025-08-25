import 'package:app/routes/app_pages.dart';
import 'package:app/services/index.dart';
import 'package:app/shared/confirmation/confirmation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

class Webview extends StatefulWidget {
  final String url;
  const Webview({super.key, required this.url});

  @override
  _WebviewState createState() => _WebviewState();
}

class _WebviewState extends State<Webview> {
  late final InAppWebViewController controller;
  late final AppLifecycleListener listener;

  InAppWebViewSettings settings = InAppWebViewSettings(
    isInspectable: kDebugMode,
    mediaPlaybackRequiresUserGesture: false,
    allowsInlineMediaPlayback: true,
    iframeAllow: "camera; microphone",
    iframeAllowFullscreen: true,
  );

  @override
  void initState() {
    // 监听app进入后台，暂停/恢复 webview
    // listener = AppLifecycleListener(
    //   onShow: () {
    //     print('AppLifecycleListener show');
    //     controller.resume();
    //   },
    //   onHide: () {
    //     print('AppLifecycleListener hide');
    //     controller.pause();
    //   },
    // );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) => exit(),
      child: Scaffold(
        floatingActionButton: Transform.translate(
          offset: Offset(0, 12),
          child: FloatingActionButton.small(
            heroTag: 'gaming',
            onPressed: exit,
            backgroundColor: Colors.transparent,
            child: Image.asset('assets/icons/back-icon.webp'),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
        body: SafeArea(
          child: InAppWebView(
            initialUrlRequest: URLRequest(url: WebUri(widget.url)),
            initialSettings: settings,
            onWebViewCreated: (controller) {
              print('object');
              this.controller = controller;
            },
            onLoadStart: (controller, url) {},
            onPermissionRequest: (controller, request) async {
              return PermissionResponse(
                resources: request.resources,
                action: PermissionResponseAction.GRANT,
              );
            },
          ),
        ),
      ),
    );
  }

  exit() async {
    final guaranteed = await Get.confirm(title: 'app.exit.game'.tr) == true;
    if (guaranteed) Get.back();
  }

  @override
  void dispose() {
    //ignore:invalid_null_aware_operator
    controller?.dispose();
    listener.dispose();
    super.dispose();
  }
}
