part of 'apis.dart';

class _UserApi {
  final login = http.post('/app/login', decoder: AuthModelWrapper.fromJson, loading: true);
  final register = http.post('/app/register', decoder: AuthModelWrapper.fromJson);
  final fastRegister = http.post('/app/quickRegister', decoder: AuthModelWrapper.fromJson);
  final queryUserInfo = http.get('/app/user-info', decoder: UserModelWrapper.fromJson);
  final logout = http.post('/app/logout');

  final refreshToken = http.get('/app/refresh-token');

  ///获取会员投注记录
  final queryGameRecords = http.get('/app/game-record', decoder: GameRecordWrapper.fromJson);

  ///消息未读数量
  final unreadMessageCount = http.get('/app/unread-message');

  ///读取消息
  final readMessage = http.post('/app/read-message');

  ///获取消息列表
  final queryMessages = http.get('/app/message-list');

  ///绑定邮箱
  final bindEmail = http.post('/app/bind-email', loading: true);

  ///绑定手机号
  final bindMobile = http.post('/app/bind-mobile');

  ///修改登陆密码
  final changePwd = http.post('/app/change-login-password');

  ///刷新余额
  final queryBalance = http.get('/app/refresh-balance', decoder: BalanceModelWrapper.fromJson);

  ///查询账变，充值，提现记录
  final queryRecords = http.get('/app/balance-log', decoder: FundRecordsWrapper.fromJson);
}
