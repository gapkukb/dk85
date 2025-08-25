import 'package:get/get.dart';

class HistoryGamesController extends GetxController {
  HistoryGamesController();

  _initData() {
    update(["history_games"]);
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
