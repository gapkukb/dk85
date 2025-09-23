import 'package:get/get.dart';

class VicPokerController extends GetxController {
  VicPokerController();

  _initData() {
    update(["poker"]);
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
