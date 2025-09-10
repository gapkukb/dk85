part of 'dialogs.dart';

enum DialogPeriodic {
  /// 不限制周期
  any,

  /// 安装后只展示一次
  once,

  /// 每次启动展示
  launch,

  /// 每天展示
  daily,

  /// 每周显示
  weekly,

  /// 每月展示
  monthly,
}

class DialogBuilder {
  /// 弹窗唯一id
  final String id;

  /// 登录状态才显示
  final bool requireAuth;

  final bool barrierDismissible;

  /// 手动控制弹窗显示
  bool manual;

  /// 优先级，数字越大越优先
  final int priority;

  /// 指定的页面显示
  final List<String> routes;

  /// 显示周期
  final DialogPeriodic peroidic;

  /// 视图构造器
  final Widget Function() builder;

  DialogBuilder({
    required this.id,
    required this.builder,
    this.priority = 0,
    this.peroidic = DialogPeriodic.launch,
    this.requireAuth = false,
    this.manual = false,
    this.barrierDismissible = false,
    this.routes = const [],
  });

  String get _key => 'dialog_cached_$id';

  String? getCache() {
    return storage.box.app.get(_key);
  }

  Future<void> setCache() {
    return storage.box.app.set(_key, DateTime.now().toIso8601String());
  }
}
