import 'package:get/get.dart';

import 'package:victory/pages/favorites/controller.dart';

class VicFavBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VicFavController>(() => VicFavController());
  }
}
