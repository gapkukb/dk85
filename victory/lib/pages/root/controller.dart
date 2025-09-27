import 'package:get/get.dart';

class RootController extends GetxController {
  var showFloatingButton = false.obs;

  RootController();

  _initData() {
    update(["root"]);
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
