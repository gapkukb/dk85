import 'package:get/get.dart';

import 'package:victory/pages/inbox_detail/controller.dart';

class InboxDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InboxDetailController>(() => InboxDetailController());
  }
}
