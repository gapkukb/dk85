import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HotController extends GetxController {
  HotController();

  final refresher = RefreshController();

  _initData() {
    update(["hot"]);
  }

  void onTap() {}

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  @override
  void onClose() {
    print("onClose");
    super.onClose();
  }

  @override
  void dispose() {
    refresher.dispose();
    super.dispose();
  }
}
