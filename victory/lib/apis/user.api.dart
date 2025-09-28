part of 'apis.dart';

class _UserApi {
  final queryUserInfo = http.get('/app/user-info', decoder: models.VicUserModel.fromJson);

  ///刷新余额
  final queryBalance = http.get('/app/refresh-balance', decoder: models.VicBalanceModel.fromJson);

  ///设置登陆密码
  final bindPwd = http.post('/app/bind-login-password', loading: true);

  ///修改登陆密码
  final changePwd = http.post('/app/change-login-password', loading: true);

  ///绑定手机号
  final bindMobile = http.post('/app/bind-mobile', loading: true);

  ///绑定邮箱
  final bindEmail = http.post('/app/bind-email', loading: true);

  ///一键洗码
  final rebate = http.post('/app/rebate', loading: true);

  ///获取会员等级列表
  final queryGradeList = http.get.list('/app/grade-list', decoder: VicVipLevelModel.fromJson, debug: true);

  ///查询周礼金领取资格
  final queryWeeklyBonus = http.get('/app/week-bonus', decoder: VicVipBounsModel.fromJson);

  ///周礼金领取
  final claimWeeklyBonus = http.post('/app/get-week-bonus', loading: true);

  ///查询月礼金领取资格
  final queryMonthlyBonus = http.get('/app/month-bonus', decoder: VicVipBounsModel.fromJson);

  ///月礼金领取
  final claimMonthlyBonus = http.post('/app/get-month-bonus', loading: true);

  ///查询升级礼金领取资格
  final queryVipUpgradeBonus = http.get.list('/app/vip-bonus', decoder: VicVipBounsModel.fromJson);

  ///升级礼金领取
  final claimVipUpgradeBonus = http.post('/app/get-vip-bonus', loading: true);

  ///获取消息列表
  final queryInbox = http.get('/app/message-list', decoder: VicInboxGroupModel.fromJson);

  ///查询账变，充值，提现记录
  final queryRecords = http.get('/app/balance-log', decoder: VicFundHistoryListModel.fromJson);

  ///获取会员投注记录
  final queryGameRecords = http.get('/app/game-record', decoder: VicGameHistoryGroupModel.fromJson);

  ///查询用户是否可参与转盘活动
  final queryLuckySpinAvalible = http.get('/app/query-user-current-first-deposit-lottery-activity', decoder: models.LuckySpinModel.fromJson);

  /// 用户参与转盘抽奖
  final drawLuckySpin = http.post('/app/draw-first-deposit-lottery-result', loading: true);

  /// 用户参与转盘抽奖
  final claimLuckySpin = http.post('/app/claim-first-deposit-lottery-price', decoder: models.LuckySpinClaimModel.fromJson, loading: true);

  /// 测试接口  重置转盘抽奖
  final resetLuckySpin = http.post('/app/reset-first-deposit-lottery-activity-user');
}
