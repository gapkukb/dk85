import 'package:get/get.dart';
import 'package:victory/apis/apis.dart';
import 'package:victory/modals/modals.dart';

class RootController extends GetxController {
  var showFloatingButton = false.obs;

  @override
  void onInit() {
    // apis.user.resetLuckySpin(payload: {"activity_id": 19});
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    VicModals.shared.resume();
  }
}
