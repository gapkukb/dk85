import 'package:get/get.dart';

class FishingController extends GetxController {
  FishingController();

  _initData() {
    update(["fishing"]);
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
