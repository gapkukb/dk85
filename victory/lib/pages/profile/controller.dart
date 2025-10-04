import 'package:get/get.dart';
import 'package:victory/services/services.dart';

class VicProfileController extends GetxController {
  VicProfileController();

  @override
  void onInit() {
    super.onInit();
    services.user.queryUserInfo();
  }
}
