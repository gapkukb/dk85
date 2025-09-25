part of 'modals.dart';

/// 模态窗显示周期
enum VicModalPeriodic {
  /// 不限制周期
  any,

  /// App单次运行期间最多显示次数
  count,

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

enum VicModalName {
  /// 完善信息
  completion,

  /// 公告
  announcement,

  /// 首充好礼
  firstDepositBouns,

  /// 每日签到
  dailyCheckIn,

  /// 游戏试玩
  gameTrial,

  /// 转盘活动
  luckSpin,

  /// 强更
  forceUpdate,
}
