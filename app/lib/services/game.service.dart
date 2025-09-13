part of 'index.dart';

class _GameService extends GetConnect {
  static _GameService get to => Get.find();

  final Rx<GameGroupModel?> _all = Rx<GameGroupModel?>(null);
  final loading = false.obs;
  final likes = <GameModel>[].obs;

  List<GameModel> get slots => _all.value?.slots ?? [];
  List<GameModel> get fish => _all.value?.fish ?? [];
  List<GameModel> get poker => _all.value?.poker ?? [];
  List<GameModel> get all => [...slots, ...fish, ...poker];

  queryAll() async {
    loading.value = true;
    final r = await apis.game.queryAllGames(queryParameters: {"game_id": "17"}).whenComplete(() {
      loading.value = false;
    });
    _all.value = r.data;
  }

  void onRefresh() {}

  @override
  void onInit() {
    queryAll();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    print("${runtimeType.toString()} closed");
  }
}
