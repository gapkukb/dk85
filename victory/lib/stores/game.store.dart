part of 'stores.dart';

class _GameService extends GetxService with AuthMixin {
  final platform = GamePlatform.fromJson({}).obs;
  final likes = RxList<Game>([]);

  List<Game> get all => [...platform.value.slots, ...platform.value.fish, ...platform.value.poker];

  void queryGames() async {
    platform.value = await Apis.game.queryGame(payload: {'game_id': '17'});
    // inspect(platformGames.value);
  }

  Future queryLikes() async {}

  Future initialize() async {
    super.initialize();
    queryGames();
    if (stores.auth.authorized) {
      queryLikes();
    }
  }

  @override
  onAuth(bool authorized) {
    if (authorized) {
      queryLikes();
    } else {
      likes.clear();
    }
  }
}
