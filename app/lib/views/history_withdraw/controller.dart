import 'package:get/get.dart';

class HistoryWithdrawController extends GetxController {
  HistoryWithdrawController();

  _initData() {
    update(["history_withdraw"]);
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
