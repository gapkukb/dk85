part of 'apis.dart';

class _AuthApi {
  final login = http.post('/app/login', decoder: VicAuthModel.fromJson, loading: true);
  final register = http.post('/app/register', decoder: VicAuthModel.fromJson, loading: true);
  final fastRegister = http.post('/app/quickRegister', decoder: VicAuthModel.fromJson);
  final logout = http.post('/app/logout');
  final refreshToken = http.get('/app/refresh-token');
}
