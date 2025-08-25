import 'package:get/get.dart';

class HistoryTopUpController extends GetxController {
  HistoryTopUpController();

  _initData() {
    update(["history_top_up"]);
  }

  void onTap() {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
