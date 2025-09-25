part of 'modals.dart';

class VicModals extends GetxService {
  static final VicModals shared = VicModals._internal();
  factory VicModals() => shared;
  VicModals._internal();

  /// 待处理的队列
  final List<VicModalBuilder> modals = [];

  /// TODO: 处理完成，等待展示的队列
  final List<Widget> _widgets = [];

  /// 默认暂停队列，等待initlize被调用
  bool paused = true;
  bool _authorized = false;
  bool _initlized = false;
  final String _currentRoute = '/';

  Future ensureInitialized() async {
    _initlized = true;
  }

  @override
  void onInit() {
    _registerModals();
    // 同步登录态
    _changeAuthorized();
    ever(services.auth.authorized.obs, _changeAuthorized);
    super.onInit();
  }

  // initlize() async {
  //   // 防止输入框聚焦，语言切换等操作触发整个app构建导致重复弹出
  //   if (_initlized) return;
  //   _initlized = true;
  //   await Future.delayed(const Duration(seconds: 1));
  //   _authorized = services.auth.authorized;

  //   add(DialogBuilder(id: DialogNames.completion, builder: () => CompletionModal()));
  //   add(DialogBuilder(id: DialogNames.topUpBouns, builder: () => TopUpBonusModal()));
  //   add(DialogBuilder(id: DialogNames.dailyCheckIn, builder: () => DailyCheckInModal()));
  //   add(DialogBuilder(id: DialogNames.announcement, manual: false, requireAuth: false, builder: () => AnnouncementModal()));

  //   services.user.queryActivity();
  //   active();
  // }

  /// 添加到队列
  add(VicModalBuilder builder) {
    if (_get(builder.name) != null) {
      talker.error("builder: ${builder.keyName} 已经存在，无法重复添加");
    } else {
      modals.add(builder);
      _sort();
      _tryNext();
    }
  }

  /// 手动触发
  Future show(VicModalName name) async {
    final modal = _get(name);
    if (modal != null) {
      talker.error("[modal_service] builder: $name 未找到");
    } else {
      modal!.manual = false;
      return _tryNext();
    }
  }

  /// 恢复队列
  void resume() {
    paused = false;
    _tryNext();
  }

  /// 暂停队列
  void pause() {
    paused = true;
  }

  /// 从队列删除
  void remove(VicModalName name) {
    modals.removeWhere((modal) => modal.name == name);
  }

  VicModalBuilder? _get(VicModalName name) {
    return modals.firstWhereOrNull((modal) => modal.name == name);
  }

  void _sort() {
    modals.sort((a, b) => b.priority.compareTo(a.priority));
  }

  Future _tryNext([_]) async {
    if (paused) return;
    if (Get.isDialogOpen == true) return;
    if (modals.isEmpty) return;
    final modal = modals.firstWhereOrNull((builder) {
      // 跳过手动控制的
      if (builder.manual) return false;
      // 检查路由和登录态
      if (!builder.match(_currentRoute, _authorized)) return false;
      // 检查冷却期
      if (builder.inCooldown) return false;

      return true;
    });
    talker.debug(modal);
    if (modal == null) return;

    await Get.generalDialog(
      pageBuilder: (context, animation, secondaryAnimation) => modal.builder(),
      transitionBuilder: modal.transitionBuilder,
      barrierDismissible: modal.barrierDismissible,
      routeSettings: RouteSettings(name: modal.keyName),
      transitionDuration: modal.transitionDuration,
    );

    if (modal.autoRemove) remove(modal.name);
    modal.close();
    Future.delayed(Durations.medium2, _tryNext);
  }

  _changeAuthorized([_]) {
    _authorized = services.auth.authorized;
  }
}
