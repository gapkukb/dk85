import 'package:get/get.dart';

import '../../models/models.dart';
import '../../stores/stores.dart';

class VicHotController extends GetxController {
  final hotGames = <VicGameModel>[].obs;
  final newGames = <VicGameModel>[].obs;
  final recommendeds = <VicGameModel>[].obs;
  final mostLikes = <VicGameModel>[].obs;
  final others = <VicGameModel>[].obs;

  void _react(_) {
    final List<VicGameModel> hotGames = [];
    final List<VicGameModel> newGames = [];
    final List<VicGameModel> recommendeds = [];
    final List<VicGameModel> mostLikes = [];
    final List<VicGameModel> others = [];

    for (var game in stores.game.all) {
      if (game.hot) {
        hotGames.add(game);
      } else if (game.recommend) {
        recommendeds.add(game);
      } else if (game.isNew) {
        newGames.add(game);
      } else {
        others.add(game);
      }
    }

    // hotGames.sort((a, b) => a.sort - b.sort);

    this.hotGames.value = hotGames;
    this.newGames.value = newGames;
    this.recommendeds.value = recommendeds;
    this.mostLikes.value = mostLikes;
    this.others.value = others;
  }

  @override
  void onReady() {
    super.onReady();
    // _react(1);
    ever(stores.game.loading, _react);
  }
}
