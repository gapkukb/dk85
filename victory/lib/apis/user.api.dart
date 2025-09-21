part of 'apis.dart';

class _UserApi {
  final queryUserInfo = http.get('/app/user-info', decoder: UserModel.fromJson);
}
