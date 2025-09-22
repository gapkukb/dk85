part of 'apis.dart';

class _AuthApi {
  final login = http.post('/app/login', decoder: AuthModel.fromJson, loading: true);
  final register = http.post('/app/register', decoder: AuthModel.fromJson, loading: true);
  final fastRegister = http.post('/app/quickRegister', decoder: AuthModel.fromJson);
  final logout = http.post('/app/logout');
  final refreshToken = http.get('/app/refresh-token');
}
