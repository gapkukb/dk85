part of 'apis.dart';

class _GameApi {
  final queryGame = http.get('/app/get-game-list', decoder: models.VicGamesModel.fromJson);
  final queryGameUrl = http.post('/app/redirect-to-game', loading: true);
  final queryFavorites = http.get('/app/list-favorites', decoder: models.VicFavsModel.fromJson);
  final favorite = http.get('/app/list-favorites', loading: true);
  final unfavorite = http.post('/app/redirect-to-game', loading: true);
}
