import 'package:get/get.dart';

class DailyCheckInController extends GetxController {
  DailyCheckInController();

  _initData() {
    update(["daily_check_in"]);
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
