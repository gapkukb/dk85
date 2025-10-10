import 'package:get/get.dart';
import 'package:victory/models/models.dart';

final class GameLogic extends GetxController {
  static final GameLogic shared = GameLogic._internal();
  factory GameLogic() => shared;
  GameLogic._internal();

  final _all = VicGamesModel.fromJson({}).obs;
  VicGamesModel get all => _all.value;
  List<VicGameModel> get slots => all.slots;
  List<VicGameModel> get fishings => all.fish;
  List<VicGameModel> get pokers => all.poker;

  Future<void> updateGames() async {}
  Future<void> updateLikes() async {}
  Future<void> addLikes() async {}
  Future<void> removeLikes() async {}
}
