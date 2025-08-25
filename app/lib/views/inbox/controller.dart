import 'package:get/get.dart';
import 'package:pull_to_refresh/src/smart_refresher.dart';

import 'index.dart';

class InboxController extends GetxController {
  // InboxController();
  final RefreshController refresher = RefreshController();
  final messages = <num>[...List.generate(20, (index) => index)].obs;

  // tap
  void handleTap(int index) {
    Get.snackbar("标题", "消息");
  }

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
  }

  /// 在 onInit() 之后调用 1 帧。这是进入的理想场所
  @override
  void onReady() {
    super.onReady();
  }

  /// 在 [onDelete] 方法之前调用。
  @override
  void onClose() {
    super.onClose();
  }

  /// dispose 释放内存
  @override
  void dispose() {
    super.dispose();
  }

  void onRefresh() {
    messages.value = [];
  }

  void onLoading() {
    messages.addAll(List.generate(20, (index) => index));
  }
}
