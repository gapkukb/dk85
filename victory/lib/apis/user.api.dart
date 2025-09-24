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
}
