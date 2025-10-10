import 'package:get/get.dart';
import 'package:victory/apis/apis.dart';
import 'package:victory/models/models.dart';

final class GameLogic extends GetxController {
  static final GameLogic shared = GameLogic._internal();
  factory GameLogic() => shared;
  GameLogic._internal();

  final _all = VicGamesModel.fromJson({}).obs;
  final _likes = RxSet();
  VicGamesModel get all => _all.value;

  List<VicGameModel> get slots => all.slots;
  List<VicGameModel> get fishings => all.fish;
  List<VicGameModel> get pokers => all.poker;

  Future<void> updateGames() async {
    final r = await apis.game.queryGame(payload: {'platform': '17'});
    if (r == null) return;
    _all.value = r;
    _compose();
  }

  Future<void> updateLikes() async {
    final r = await apis.game.queryFavorites();
    if (r == null) return;
    _likes.assignAll(r.list.map((i) => i.uid));
    _compose();
  }

  Future<void> addLike(VicGameModel game) async {}
  Future<void> removeLike() async {}

  Future<void> refetch() async {
    updateGames();
    updateLikes();
  }

  void clear() async {
    _likes.clear();
    _all.value.slots.clear();
    _all.value.fish.clear();
    _all.value.poker.clear();
  }

  _compose() {
    if (_likes.isEmpty) return;
    _mapper(_all.value.slots);
    _mapper(_all.value.fish);
    _mapper(_all.value.poker);
  }

  _mapper(List<VicGameModel> games) {
    for (var game in games) {
      if (_likes.contains(game.uid)) {
        game.liked.value = true;
      }
    }
  }
}
