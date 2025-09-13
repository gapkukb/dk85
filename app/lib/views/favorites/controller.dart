import 'package:app/models/game.model.dart';
import 'package:app/services/index.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FavoritesController extends GetxController {
  FavoritesController();

  final refresher = RefreshController();
  List<GameModel> get games => services.game.all.where((i) => i.liked).toList();

  @override
  void onInit() {
    services.game.queryLikes();
    super.onInit();
  }

  @override
  onClose() {
    refresher.dispose();
    super.onClose();
  }

  List<GameModel> mock() {
    return List.filled(24, GameModel.fromJson({'platform': 'one', 'name': BoneMock.words(8)}));
  }
}
