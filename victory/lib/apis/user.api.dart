part of 'apis.dart';

class _UserApi {
  final queryUserInfo = http.get('/app/user-info', decoder: VicUserModel.fromJson);

  ///刷新余额
  final queryBalance = http.get('/app/refresh-balance', decoder: VicBalanceModel.fromJson);
}
