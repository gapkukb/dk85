import 'package:app/apis/apis.dart';
import 'package:app/models/game.model.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FavoritesController extends GetxController {
  FavoritesController();

  final refresher = RefreshController();
  final loading = true.obs;
  final favorites = <GameModel>[].obs;

  @override
  void onInit() {
    queryFavorites();
    super.onInit();
  }

  @override
  onClose() {
    refresher.dispose();
    super.onClose();
  }

  Future queryFavorites() async {
    final r = await apis.game.queryFavorites(payload: {'page': 1, 'size': '1000'}).whenComplete(() {
      loading.value = false;
    });
    favorites.value = r.data.fish;
  }

  List<GameModel> mock() {
    return List.filled(24, GameModel.fromJson({'platform': 'one', 'name': BoneMock.words(8)}));
  }
}
