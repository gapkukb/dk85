import 'package:get/get.dart';

class FavoritesController extends GetxController {
  FavoritesController();

  _initData() {
    update(["favorites"]);
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
