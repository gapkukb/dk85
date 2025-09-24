import 'package:get/get.dart';

import 'controller.dart';

class VicFavBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VicFavController>(() => VicFavController());
  }
}
