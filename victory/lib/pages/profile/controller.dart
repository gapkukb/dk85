import 'package:get/get.dart';

class VicProfileController extends GetxController {
  VicProfileController();

  _initData() {
    update(["profile"]);
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
