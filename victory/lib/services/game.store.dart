part of 'services.dart';

class _GameService extends GetxService {
  final loading = true.obs;
  final likesLoading = true.obs;
  final platform = VicGamesModel.fromJson({}).obs;
  List<VicGameModel> get slots => platform.value.slots;
  List<VicGameModel> get fish => platform.value.fish;
  List<VicGameModel> get poker => platform.value.poker;
  List<VicGameModel> get all => [...platform.value.slots, ...platform.value.fish, ...platform.value.poker];

  final likes = RxList<VicGameModel>([]);

  @override
  onInit() {
    super.onInit();
    services.auth.listen((authorized) {
      if (authorized) {
        queryLikes();
      } else {
        for (var item in all) {
          item.liked.value = false;
        }
        platform.refresh();
      }
    });
  }

  Future queryGames() async {
    loading.value = true;
    platform.value = await apis.game.queryGame(payload: {'game_id': '17'});
    loading.value = false;
  }

  Future queryLikes() async {
    final r = await apis.game.queryFavorites();
    likesLoading.value = false;
    final likesMap = Map.fromEntries(r.list.map((item) => MapEntry("${item.platformId}${item.gameId}", 1)));
    for (var item in all) {
      item.liked.value = likesMap.containsKey("${item.platformId}${item.id}");
    }
    platform.refresh();
  }

  Future switchFavorite(VicGameModel game) async {
    if (!services.auth.ensureAuthorized) return;
    final f = game.liked.value ? apis.game.unfavorite : apis.game.favorite;
    await f(payload: {'platform_id': game.platformId, 'game_id': game.id});
    game.liked.value = !game.liked.value;
    services.game.queryLikes();
  }

  Future ensureInitialized() async {
    queryGames().then((_) {
      if (services.auth.authorized) {
        queryLikes();
      }
    });
  }
}
