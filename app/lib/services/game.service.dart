part of 'index.dart';

class _GameService extends GetConnect {
  static _GameService get to => Get.find();

  final Rx<GameGroupModel?> _all = Rx<GameGroupModel?>(null);
  final loading = false.obs;
  final likesLoading = true.obs;

  List<GameModel> get slots => _all.value?.slots ?? [];
  List<GameModel> get fish => _all.value?.fish ?? [];
  List<GameModel> get poker => _all.value?.poker ?? [];
  List<GameModel> get all => [...slots, ...fish, ...poker];

  Future queryGames() async {
    loading.value = true;
    final r = await apis.game.queryAllGames(queryParameters: {"game_id": "17"}).whenComplete(() {
      loading.value = false;
    });
    _all.value = r.data;
  }

  Future queryLikes() async {
    if (!services.auth.authorized) return;
    final r = await apis.game.queryFavorites();
    likesLoading.value = false;
    final likesMap = Map.fromEntries(r.data.list.map((item) => MapEntry("${item.platformId}${item.gameId}", 1)));
    for (var item in all) {
      item.liked = likesMap.containsKey("${item.platformId}${item.id}");
    }
    _all.refresh();
  }

  clean() {
    likesLoading.value = true;
    for (var item in all) {
      item.liked = false;
    }
  }

  void onRefresh() {}

  @override
  void onInit() {
    queryGames().then((_) {
      if (services.auth.authorized) {
        queryLikes();
      }
    });
    super.onInit();
  }
}
