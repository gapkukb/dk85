part of 'apis.dart';

class _GameApi {
  final queryAllGames = http.get('/app/get-game-list', decoder: GameModelWrapper.fromJson);
  final queryFavorites = http.get('/app/list-favorites', decoder: FavoriteModelWrapper.fromJson);
  final queryGameUrl = http.post('/app/redirect-to-game', decoder: ModelWrapper.fromJson, loading: true);
}
