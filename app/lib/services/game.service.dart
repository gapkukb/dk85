part of 'index.dart';

class GameService extends GetConnect {
  static GameService get to => Get.find();

  final Rx<GameModel?> _all = Rx<GameModel?>(null);
  final loading = false.obs;

  List<Game> get slots => _all.value?.slots ?? [];
  List<Game> get fish => _all.value?.fish ?? [];
  List<Game> get poker => _all.value?.poker ?? [];
  List<Game> get all => [...slots, ...fish, ...poker];

  queryAll() async {
    loading.value = true;
    _all.value = await queryAllGames(payload: {"game_id": "17"}).whenComplete(
      () {
        loading.value = false;
      },
    );
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
