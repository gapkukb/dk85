import 'package:get/get.dart';

import 'controller.dart';

class CasinoBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CasinoController>(() => CasinoController());
  }
}
