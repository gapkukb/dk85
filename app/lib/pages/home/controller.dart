import 'package:get/get.dart';

import '../announcement/view.dart';

class HomeController extends GetxController {
  HomeController();

  @override
  void onReady() {
    super.onReady();
    Get.dialog(const AnnouncementView(), barrierDismissible: false);
  }
}
