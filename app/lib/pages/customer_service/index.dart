import 'package:app/pages/webview/index.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CustomeServiceView extends StatefulWidget {
  const CustomeServiceView({super.key});

  @override
  CustomeServiceViewState createState() => CustomeServiceViewState();
}

class CustomeServiceViewState extends State<CustomeServiceView> {
  static const url =
      "https://www.chatfun666.com/chat/serverLogin?initializeType=server&serverNo=sc770014224833410902844454240023&companyId=mg888&memberId=&memberName=&language=km";
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();

    controller = WebViewController()
      ..clearCache()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: WebViewWidget(controller: controller));
  }
}
