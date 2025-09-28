part of 'modals.dart';

class VicModals extends GetxService {
  static final VicModals shared = VicModals._internal();
  factory VicModals() => shared;
  VicModals._internal();

  /// 弹窗合集
  final Map<VicModalName, VicModalBuilder> modals = {};

  /// 显示队列
  final List<VicModalBuilder> queue = [];

  /// 默认暂停队列，等待initlize被调用
  bool paused = true;
  bool _authorized = false;
  final String _currentRoute = '/';

  Future ensureInitialized() async {}

  @override
  void onInit() {
    _registerModals();
    // 同步登录态
    services.auth.listen(_changeAuthorized);
    services.app.listenRouting(_changeRouting);
    super.onInit();
  }

  /// 添加到队列
  add(VicModalBuilder builder) {
    if (modals[builder.name] != null) {
      talker.error("builder: ${builder.keyName} 已经存在，无法重复添加");
    } else {
      modals.putIfAbsent(builder.name, () => builder);
      if (!builder.manual) {
        queue.add(builder);
      }
      _sort();
      _tryNext();
    }
  }

  /// 手动触发
  Future show(VicModalName name) async {
    final modal = _get(name);
    if (modal == null) {
      talker.error("[modal_service] builder: $name 未找到");
    } else {
      queue.add(modal);
      _sort();
      // modal.manual = false;
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
    queue.removeWhere((modal) => modal.name == name);
  }

  VicModalBuilder? _get(VicModalName name) {
    return modals[name];
    // if (name == VicModalName.completion) {
    //   talker.debug(modals);
    //   for (var modal in queue) {
    //     talker.debug(modal.name == name);
    //   }
    // }
    // return queue.firstWhereOrNull((modal) => modal.name == name);
  }

  void _sort() {
    queue.sort((a, b) => b.priority.compareTo(a.priority));
  }

  Future _tryNext([_]) async {
    if (paused) return;
    if (Get.isDialogOpen == true) return;
    if (queue.isEmpty) return;
    // final modal = queue.firstWhereOrNull((builder) {
    //   // 跳过手动控制的
    //   if (builder.manual) return false;
    //   // 检查路由和登录态
    //   if (!builder.match(_currentRoute, _authorized)) return false;
    //   // 检查冷却期
    //   if (builder.inCooldown) return false;

    //   return true;
    // });

    final modal = queue.first;
    await Get.generalDialog(
      pageBuilder: (context, animation, secondaryAnimation) => modal.builder(),
      transitionBuilder: modal.transitionBuilder ?? vicFadeScaleAnimationBuilder,
      barrierDismissible: modal.barrierDismissible,
      routeSettings: RouteSettings(name: modal.keyName),
      transitionDuration: modal.transitionDuration,
    );

    queue.removeAt(0);
    modal.close();
    Future.delayed(Durations.medium2, _tryNext);
  }

  _changeAuthorized([_]) {
    _authorized = services.auth.authorized;
    _tryNext();
  }

  _changeRouting(String current) {
    Logger.debug(current);
  }
}
