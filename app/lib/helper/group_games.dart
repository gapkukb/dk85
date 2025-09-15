import 'package:app/models/game.model.dart';

class GroupGames {
  final List<GameModel> hotGames = [];
  final List<GameModel> newGames = [];
  final List<GameModel> recommendeds = [];
  final List<GameModel> mostLikes = [];
  final List<GameModel> others = [];
  GroupGames(final List<GameModel>? games) {
    if (games == null) return;
    for (var game in games) {
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
  }
}
