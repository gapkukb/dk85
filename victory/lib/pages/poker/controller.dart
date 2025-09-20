import 'package:get/get.dart';

class PokerController extends GetxController {
  PokerController();

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
