import 'package:get/get.dart';

import '../../models/models.dart';
import '../../stores/stores.dart';

class HotController extends GetxController {
  final hotGames = <Game>[].obs;
  final newGames = <Game>[].obs;
  final recommendeds = <Game>[].obs;
  final mostLikes = <Game>[].obs;
  final others = <Game>[].obs;

  void _react(_) {
    final List<Game> hotGames = [];
    final List<Game> newGames = [];
    final List<Game> recommendeds = [];
    final List<Game> mostLikes = [];
    final List<Game> others = [];

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
