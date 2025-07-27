part of 'index.dart';

class WebviewController extends GetxController {
  WebviewController();

  late final WebViewController webview;

  // tap
  void handleTap(int index) {
    Get.snackbar("标题", "消息");
  }

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
    webview =
        WebViewController()
          ..enableZoom(false)
          ..clearCache()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..setNavigationDelegate(
            NavigationDelegate(
              onHttpAuthRequest: (request) {
                webview.runJavaScript('window.webview=123;');
              },
              onPageStarted: (url) {
                webview.runJavaScript('window.webview=456;');
              },
              onUrlChange: (change) {
                webview.runJavaScript('window.webview=789;');
              },
              onProgress: (url) {
                webview.runJavaScript('window.webview=666;');
              },
            ),
          );
  }

  /// 在 onInit() 之后调用 1 帧。这是进入的理想场所
  @override
  void onReady() {
    super.onReady();
  }

  /// 在 [onDelete] 方法之前调用。
  @override
  void onClose() {
    super.onClose();
  }

  /// dispose 释放内存
  @override
  void dispose() {
    super.dispose();
  }
}
