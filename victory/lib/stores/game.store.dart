part of 'stores.dart';

class _GameService extends GetxService with AuthMixin {
  final loading = true.obs;
  final platform = VicGamesModel.fromJson({}).obs;
  List<Game> get slots => platform.value.slots;
  List<Game> get fish => platform.value.fish;
  List<Game> get poker => platform.value.poker;
  List<Game> get all => [...platform.value.slots, ...platform.value.fish, ...platform.value.poker];

  final likes = RxList<Game>([]);
  void queryGames() async {
    loading.value = true;
    platform.value = await Apis.game.queryGame(payload: {'game_id': '17'});
    loading.value = false;
  }

  Future queryLikes() async {}

  Future ensureInitialized() async {
    super.ensureInitialized();
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
