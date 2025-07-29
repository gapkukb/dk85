import 'package:get/get.dart';

import 'controller.dart';

class MeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MeController>(() => MeController());
  }
}
