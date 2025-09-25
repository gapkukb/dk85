part of 'modals.dart';

class VicModalBuilder {
  final Map<String, int> _counter = {};

  /// 弹窗名词标识，必须唯一
  final VicModalName name;

  /// 关闭后是否从队列删除,
  /// 默认true，自动删除，
  /// 设置false必须配合manual=true，否则会无限弹出
  final bool autoRemove;

  /// 只有登录状态才显示
  final bool requireAuth;

  /// 只在指定的页面显示
  final List<String>? routes;

  final bool barrierDismissible;

  /// app单次运行期间最大展示次数
  final int times;

  /// 手动控制弹窗显示
  bool manual;

  /// 优先级，数字越大越优先
  final int priority;

  /// 显示周期
  final VicModalPeriodic peroidic;

  /// 视图构造器
  final Widget Function() builder;

  /// 动画构造器
  final RouteTransitionsBuilder? transitionBuilder;

  final Duration transitionDuration;

  VicModalBuilder({
    required this.name,
    required this.builder,
    this.priority = 0,
    this.peroidic = VicModalPeriodic.any,
    this.requireAuth = false,
    this.manual = false,
    this.barrierDismissible = false,
    this.routes,
    this.times = 9999,
    this.autoRemove = true,
    this.transitionBuilder,
    this.transitionDuration = const Duration(milliseconds: 200),
  });

  String get keyName => 'modal_${name.name}';

  String get _key => 'modal_$keyName';

  // 已经显示次数
  int get _count => _counter[_key] ?? 0;

  /// 检查是否在冷却期
  bool get inCooldown {
    final value = storage.app.cacher.read<String>(_key);
    if (value == null) return false;
    final recently = DateTime.parse(value);
    final now = DateTime.now();

    return switch (peroidic) {
      VicModalPeriodic.any => false,
      // 缓存值在 value==null 已经判断过了，这里直接返回false
      VicModalPeriodic.once => true,
      VicModalPeriodic.count => _count >= times,
      VicModalPeriodic.launch => _count >= 1,
      // 当前日期比缓存日期大1天
      VicModalPeriodic.daily => now.difference(recently).inDays < 1,
      // 当前日期比缓存日期大7天
      VicModalPeriodic.weekly => now.difference(recently).inDays < 7,
      // 当前日期比缓存日期大30天
      VicModalPeriodic.monthly => now.difference(recently).inDays < 30,
    };
  }

  // 匹配路由和登录态
  bool match(String crrentRoute, bool authorized) {
    // return true;
    if (requireAuth && !authorized) return false;
    if (routes == null) return true;
    return routes!.contains(crrentRoute);
  }

  Future<void> close() {
    // 内存计数
    countUp();
    // 本地缓存
    return storage.app.cacher.write(_key, DateTime.now().toIso8601String());
  }

  void countUp() {
    _counter.putIfAbsent(_key, () => 0);
    _counter[_key] = _counter[_key]! + 1;
  }
}
