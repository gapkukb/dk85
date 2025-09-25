import 'package:get/get.dart';

import 'package:victory/pages/search/controller.dart';

class VicSearchBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VicSearchController>(() => VicSearchController());
  }
}
