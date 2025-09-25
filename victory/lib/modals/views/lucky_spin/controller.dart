import 'package:get/get.dart';

class LuckySpinController extends GetxController {
  LuckySpinController();

  _initData() {
    update(["lucky_spin"]);
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
