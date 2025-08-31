part of 'index.dart';

final queryAllGames = get('/app/get-game-list', GameModelWrapper.fromJson);
final queryGameUrl = post('/app/redirect-to-game');
