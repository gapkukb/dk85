part of 'modals.dart';

/// 模态窗显示周期
enum VicModalPeriodic {
  /// 不限制周期
  any,

  /// App冷启动期间最多显示次数
  count,

  /// 安装后只展示一次
  once,

  /// 每次冷启动弹出一次
  launch,

  /// 每天展示
  daily,

  /// 每周显示
  weekly,

  /// 每月展示
  monthly;

  bool get isAutoRemove {
    return !(this == VicModalPeriodic.once || this == VicModalPeriodic.any);
  }
}

enum VicModalName {
  /// 完善信息
  completion,

  /// 公告
  announcement,

  /// 首充好礼
  first_deposit_bouns,

  /// 每日签到
  daily_check_in,

  /// 游戏试玩
  game_trial,

  /// 转盘活动
  lucky_spin,

  /// 强更
  force_update,
}
