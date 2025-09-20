import 'package:get/get.dart';

class BonusController extends GetxController {
  BonusController();

  _initData() {
    update(["bonus"]);
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
