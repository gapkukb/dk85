part of 'apis.dart';

class _GameApi {
  final queryGame = http.get('/app/get-game-list', decoder: models.GamePlatform.fromJson);
}
