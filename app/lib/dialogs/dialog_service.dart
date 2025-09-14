part of 'dialogs.dart';

class Dialogs extends GetxService {
  static Dialogs get to => Get.find<Dialogs>();
  final List<DialogBuilder> _queue = [];
  final Set<String> _launched = {};
  bool _authorized = false;
  bool _paused = true;
  String _curretRoute = '';

  Dialogs() {
    // 初始化时删除period = launch的缓存
  }

  initlize() async {
    await Future.delayed(Duration(seconds: 1));
    _authorized = services.auth.authorized;

    add(DialogBuilder(id: DialogNames.completion, builder: () => CompletionModal()));
    add(DialogBuilder(id: DialogNames.topUpBouns, builder: () => TopUpBonusModal()));
    add(DialogBuilder(id: DialogNames.dailyCheckIn, builder: () => DailyCheckInModal()));
    add(DialogBuilder(id: DialogNames.announcement, manual: false, requireAuth: false, builder: () => AnnouncementModal()));

    services.user.queryActivity();
    active();
  }

  // 优惠页面可以再次手动唤起弹窗
  dailyCheckIn() {
    add(DialogBuilder(id: DialogNames.dailyCheckIn, manual: false, builder: () => DailyCheckInModal()));
  }

  // 添加到队列，并立即检查是否满足显示条件，满足条件会直接展示
  add(DialogBuilder dialog) async {
    final exist = _queue.any((item) => item.id == dialog.id);
    if (exist) {
      //('不允许重复添加');
      return;
    }
    _queue.add(dialog);
    _sortQueue();
    WidgetsBinding.instance.addPostFrameCallback((_) => _tryNext());
  }

  // 从队列移除
  remove(String id) {
    _queue.removeWhere((item) => item.id == id);
  }

  // 手动控制弹窗展示
  show(String id) {
    final dialog = _queue.firstWhereOrNull((item) => item.id == id);
    if (dialog == null) return;
    dialog.manual = false;
    _tryNext();
  }

  deactive() {
    _paused = true;
  }

  active() {
    _paused = false;
    _tryNext();
  }

  void onRouteChanged(Routing? routing) async {
    if (routing == null || routing.route is PopupRoute) {
      return;
    }
    _curretRoute = routing.current;
    await Future.delayed(Durations.medium4);
    _tryNext();
  }

  void onAuthChanged(authorized) {
    _authorized = authorized;
    // _queue.removeWhere((item) => item.requireAuth == authorized);
    _tryNext();
  }

  _sortQueue() {
    _queue.sort((a, b) => b.priority.compareTo(a.priority));
  }

  _tryNext() async {
    if (_paused) return;
    if (Get.isDialogOpen == true) return;
    if (_queue.isEmpty) return;
    final dialog = _queue.firstWhereOrNull((item) {
      // 跳过手动控制的弹窗
      if (item.manual) return false;
      if (item.requireAuth && !_authorized) return false;
      // if (item.routes.isNotEmpty && !item.routes.contains(_curretRoute)) {
      //   return false;
      // }
      return true;
    });
    if (dialog == null) return;
    // 检查是否满足周期限制
    // if (!_validatePeriod(dialog)) return;
    await Get.dialog(dialog.builder(), barrierDismissible: dialog.barrierDismissible);
    remove(dialog.id);
    _launched.add(dialog.id);
    await dialog.setCache();
    Future.delayed(Durations.medium4, _tryNext);
  }

  bool _validatePeriod(DialogBuilder dialog) {
    final p = dialog.peroidic;
    // 内存检查
    if (p == DialogPeriodic.any) return true;
    if (p == DialogPeriodic.launch) {
      return !_launched.contains(dialog.id);
    }
    // 缓存检查
    final value = dialog.getCache();

    if (p == DialogPeriodic.once) return value != null;

    if (value == null) return true;
    final cached = DateTime.parse(value);
    final now = DateTime.now();

    switch (p) {
      case DialogPeriodic.daily:
        return now.difference(cached).inDays >= 1;
      case DialogPeriodic.weekly:
        return now.difference(cached).inDays >= 7;
      case DialogPeriodic.monthly:
        return now.difference(cached).inDays >= 30;
      default:
        return true;
    }
  }
}
