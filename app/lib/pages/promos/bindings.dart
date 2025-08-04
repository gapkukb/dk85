import 'package:get/get.dart';

import 'controller.dart';

class PromosBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PromosController>(() => PromosController());
  }
}
