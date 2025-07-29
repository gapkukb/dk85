import 'package:get/get.dart';

import 'controller.dart';

class DepositBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DepositController>(() => DepositController());
  }
}
