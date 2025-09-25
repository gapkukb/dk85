part of 'services.dart';

class _GameService extends GetxService with AuthMixin {
  final loading = true.obs;
  final likesLoading = true.obs;
  final platform = VicGamesModel.fromJson({}).obs;
  List<VicGameModel> get slots => platform.value.slots;
  List<VicGameModel> get fish => platform.value.fish;
  List<VicGameModel> get poker => platform.value.poker;
  List<VicGameModel> get all => [...platform.value.slots, ...platform.value.fish, ...platform.value.poker];

  final likes = RxList<VicGameModel>([]);

  void queryGames() async {
    loading.value = true;
    platform.value = await apis.game.queryGame(payload: {'game_id': '17'});
    loading.value = false;
  }

  Future queryLikes() async {
    if (!services.auth.authorized) return;
    final r = await apis.game.queryFavorites();
    likesLoading.value = false;
    final likesMap = Map.fromEntries(r.list.map((item) => MapEntry("${item.platformId}${item.gameId}", 1)));
    for (var item in all) {
      item.liked = likesMap.containsKey("${item.platformId}${item.id}");
    }
    platform.refresh();
  }

  @override
  Future ensureInitialized() async {
    super.ensureInitialized();
    queryGames();
    if (services.auth.authorized) {
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
