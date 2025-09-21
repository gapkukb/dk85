part of 'apis.dart';

class _GameApi {
  final queryGame = http.get('/app/get-game-list', decoder: models.GamePlatform.fromJson);
  final queryGameUrl = http.post('/app/redirect-to-game', loading: true);
  final favorite = http.get('/app/list-favorites', loading: true);
  final unfavorite = http.post('/app/redirect-to-game', loading: true);
}
