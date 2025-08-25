import 'package:get/get.dart';

import 'controller.dart';

class FundsMngBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FundsMngController>(() => FundsMngController());
  }
}
