import 'package:app/models/game.model.dart';

class GroupGames {
  final List<Game> hotGames = [];
  final List<Game> newGames = [];
  final List<Game> recommendeds = [];
  final List<Game> mostLikes = [];
  final List<Game> others = [];
  GroupGames(final List<Game>? games) {
    if (games == null) return;
    for (var game in games) {
      if (game.hot == 1) {
        hotGames.add(game);
      } else if (game.recommend == 1) {
        recommendeds.add(game);
      } else if (game.is_new == 1) {
        newGames.add(game);
      } else {
        others.add(game);
      }
    }
  }
}
