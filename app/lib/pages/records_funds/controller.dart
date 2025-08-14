part of 'index.dart';

class RecordsFundsController extends GetxController {
  RecordsFundsController();

  final dates = [
    Selection(name: "time.today".tr, value: 0),
    Selection(name: "time.yesterday".tr, value: 1),
    Selection(name: "time.last3days".tr, value: 2),
    Selection(name: "time.last7days".tr, value: 3),
    Selection(name: "time.last30days".tr, value: 4),
  ];

  final current = 0.obs;

  get currentName => dates[current.value].name;

  // tap
  void handleTap(int index) {
    Get.snackbar("标题", "消息");
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

  @override
  Future<void> doLoading() async {
    await Future.delayed(Durations.long4);
  }

  @override
  Future<void> doRefresh() async {
    await Future.delayed(Durations.long4);
  }
}

class Selection {
  final String name;
  final int value;

  const Selection({required this.name, required this.value});
}
