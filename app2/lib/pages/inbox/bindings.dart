import 'package:get/get.dart';

import 'controller.dart';

class InboxBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InboxController>(() => InboxController());
  }
}
