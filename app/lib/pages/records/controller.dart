part of 'index.dart';

class RecordsController extends GetxController {
  RecordsController();

  final tabs = [_Menu("records.funds".tr, 0), _Menu("records.games".tr, 1), _Menu("records.deposit".tr, 2), _Menu("records.withdraw".tr, 3)];
  final current = 0.obs;

  get currentName => tabs[current.value].name;

  void select(_Menu menu) {
    current.value = menu.value;
    Get.back();
  }

  Route onGenerateRoute(RouteSettings settings) {
    if (settings.name == Routes.recordsFunds) {
      return GetPageRoute(settings: settings, page: () => const RecordsFundsView(), binding: RecordsFundsBinding());
    }
    return GetPageRoute(settings: settings, page: () => const SizedBox());
  }

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
}

class _Menu {
  final String name;
  final int value;

  _Menu(this.name, this.value);
}
