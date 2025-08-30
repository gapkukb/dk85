part of 'index.dart';

final loginApi = post('/app/login', AuthModel.fromJson);
final registerApi = post('/app/register', AuthModel.fromJson);
final fastRegisterApi = post('/app/quickRegister', AuthModel.fromJson);
final queryUserInfoApi = post('/app/user-info', UserInfoModel.fromJson);
final logoutApi = post('/app/logout');

final refreshTokenApi = get('/app/refresh-token');

///获取会员投注记录
final queryGameRecordsApi = get('/app/game-record');

///消息未读数量
final unreadMessageCountApi = get('/app/unread-message');

///读取消息
final readMessageApi = post('/app/read-message');

///获取消息列表
final queryMessagesApi = get('/app/message-list');

///绑定邮箱
final bindEmailApi = post('/app/email');

///绑定手机号
final bindMobileApi = post('/app/bind-mobile');

///修改登陆密码
final changePwdApi = post('/app/change-login-password');

///刷新余额
final queryBalanceApi = get('/app/refresh-balance', BalanceModel.fromJson);
