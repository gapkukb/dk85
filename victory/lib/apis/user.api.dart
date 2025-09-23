part of 'apis.dart';

class _UserApi {
  final queryUserInfo = http.get('/app/user-info', decoder: models.VicUserModel.fromJson);

  ///刷新余额
  final queryBalance = http.get('/app/refresh-balance', decoder: models.VicBalanceModel.fromJson);
}
