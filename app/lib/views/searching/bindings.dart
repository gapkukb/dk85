import 'package:get/get.dart';

import 'controller.dart';

class SearchingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchingController>(() => SearchingController());
  }
}
