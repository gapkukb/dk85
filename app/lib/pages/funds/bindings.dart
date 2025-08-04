import 'package:get/get.dart';

import 'controller.dart';

class FundsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FundsController>(() => FundsController());
  }
}
