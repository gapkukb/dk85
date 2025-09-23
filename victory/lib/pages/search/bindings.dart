import 'package:get/get.dart';

import 'controller.dart';

class VicSearchBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VicSearchController>(() => VicSearchController());
  }
}
