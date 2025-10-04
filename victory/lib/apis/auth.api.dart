part of 'apis.dart';

class _AuthApi {
  final login = http.post('/app/login', decoder: models.VicAuthModel.fromJson, loading: true);
  final register = http.post('/app/register', decoder: models.VicAuthModel.fromJson, loading: true);
  final fastRegister = http.post('/app/quickRegister', decoder: models.VicAuthModel.fromJson);
  final logout = http.post('/app/logout', loading: true);
  final refreshToken = http.get('/app/refresh-token');
}
