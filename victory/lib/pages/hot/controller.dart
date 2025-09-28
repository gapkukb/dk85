import 'package:get/get.dart';

import 'package:victory/models/models.dart';
import 'package:victory/services/services.dart';
import 'package:victory/shared/logger/logger.dart';

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

    for (var game in services.game.all) {
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
    Logger.debug('Hot Games: ${hotGames.length}');
    this.newGames.value = newGames;
    Logger.debug('New Games: ${newGames.length}');
    this.recommendeds.value = recommendeds;
    this.mostLikes.value = mostLikes;
    this.others.value = others;
  }

  @override
  void onReady() {
    super.onReady();
    // _react(1);
    ever(services.game.platform, _react);
  }
}
