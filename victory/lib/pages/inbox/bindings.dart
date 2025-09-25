import 'package:get/get.dart';

import 'package:victory/pages/inbox/controller.dart';

class VicInboxBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InboxController>(() => InboxController());
  }
}
