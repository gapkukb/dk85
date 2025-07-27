part of 'index.dart';

class PlayingController extends GetxController {
  PlayingController();

  static void play() {
    Get.toNamed(Routes.playing);
  }

  static const testUrl =
      'https://cdn.dvdfh.com/sea/client/pro/h5/h5link/index.html?time=1753578019&game_id=51001&orientation=1&domain=wss://seaweb.dvdfh.com/mmk&file_domain=https://cdn.dvdfh.com/sea/art/pro&api_domain=https://seaapi.dvdfh.com&client_url=https://cdn.dvdfh.com/sea/client/pro/h5&client1_url=https://log-cdn.dvdfh.com&app_id=7OhdRbufeL&language=en&certification=&logo=/03_website/Product/logo_jl.js&token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhcHBfaWQiOiI3T2hkUmJ1ZmVMIiwiZXhwaXJlIjoxNzUzNTc4MzE5LCJwbGF5ZXJfaWQiOjYxMzA5MTAyfQ.6EG6TBBaJ6as8MiloFfxGEd2wrf9NP70EwlDViys_r4';
  late final WebViewController controller;
  // tap
  void handleTap(int index) {
    Get.snackbar("标题", "消息");
  }

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
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
      ..loadRequest(Uri.parse(testUrl));
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
