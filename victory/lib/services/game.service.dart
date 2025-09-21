part of 'services.dart';

class _GameService extends GetxService {
  final platformGames = GamePlatform.fromJson({}).obs;
  void queryGames() async {
    platformGames.value = await Apis.game.queryGame(payload: {'game_id': '17'});
    // inspect(platformGames.value);
  }

  Future initialize() async {
    queryGames();
  }
}
