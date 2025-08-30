import 'package:app/shared/confirmation/confirmation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:get/get.dart';

class Webview extends StatefulWidget {
  final String url;
  const Webview({super.key, required this.url});

  @override
  _WebviewState createState() => _WebviewState();
}

class _WebviewState extends State<Webview> {
  final controller = WebViewController()
    ..enableZoom(false)
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setHorizontalScrollBarEnabled(false)
    ..setVerticalScrollBarEnabled(false)
    ..clearLocalStorage()
    ..clearCache()
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) {},
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

  @override
  void initState() {
    controller.loadRequest(Uri.parse(widget.url));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        confirmExit();
      },
      child: Scaffold(
        floatingActionButton: Transform.translate(
          offset: Offset(0, 12),
          child: FloatingActionButton.small(
            heroTag: 'gaming',
            onPressed: confirmExit,
            backgroundColor: Colors.transparent,
            child: Image.asset('assets/icons/back-icon.webp'),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
        body: Scaffold(body: WebViewWidget(controller: controller)),
      ),
    );
  }

  confirmExit() async {
    final guaranteed = await Get.confirm(title: 'app.exit.game'.tr) == true;
    if (guaranteed) Get.back();
  }
}
