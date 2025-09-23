import 'package:get/get.dart';

class VicSlotsController extends GetxController {
  VicSlotsController();

  _initData() {
    update(["slots"]);
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
