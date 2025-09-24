import 'package:get/get.dart';

import 'controller.dart';

class InboxDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InboxDetailController>(() => InboxDetailController());
  }
}
