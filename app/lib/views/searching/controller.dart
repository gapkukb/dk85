import 'package:app/constants/game.dart';
import 'package:app/models/game.model.dart';
import 'package:app/services/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class _Tab {
  final String name;
  final int value;

  _Tab({required this.name, required this.value});
}

class SearchingController extends GetxController
    with GetSingleTickerProviderStateMixin {
  SearchingController();

  late final TabController tab;
  final input = TextEditingController();
  final gameService = GameService.to;
  final keywords = ''.obs;
  final kind = GameKind.all.id.obs;
  final platforms = ['all'].obs;

  final List<_Tab> tabs = [
    _Tab(name: GameKind.all.displayName, value: GameKind.all.id),
    _Tab(name: GameKind.slots.displayName, value: GameKind.slots.id),
    _Tab(name: GameKind.fishing.displayName, value: GameKind.fishing.id),
    _Tab(name: GameKind.poker.displayName, value: GameKind.poker.id),
  ];

  List<GameModel> get filteredGames {
    if (keywords.isEmpty) return _filterWithoutKeywords(kind.value);
    return _filterWithKeywords(kind.value, keywords.value);
  }

  List<GameModel> _filterWithoutKeywords(int kind) {
    if (kind == GameKind.all.id) return gameService.all;
    if (kind == GameKind.slots.id) return gameService.slots;
    if (kind == GameKind.fishing.id) return gameService.fish;
    if (kind == GameKind.poker.id) return gameService.poker;
    return [];
  }

  List<GameModel> _filterWithKeywords(int kind, String keywords) {
    bool predicate(GameModel game) =>
        game.name.contains(keywords) || game.platform.contains(keywords);

    List<GameModel> filter(Iterable<GameModel> games) =>
        games.where(predicate).toList();

    if (kind == GameKind.all.id) {
      return filter(gameService.all);
    }
    if (kind == GameKind.slots.id) {
      return filter(gameService.slots);
    }
    if (kind == GameKind.fishing.id) {
      return filter(gameService.fish);
    }
    if (kind == GameKind.poker.id) {
      return filter(gameService.poker);
    }
    return [];
  }

  // tap
  void search([dynamic _]) {
    keywords.value = input.text.trim();
    kind.value = tabs[tab.index].value;
    platforms.value = <String>['all'];
  }

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    tab = TabController(length: tabs.length, vsync: this);
    super.onInit();
  }

  @override
  void onClose() {
    tab.dispose();
    input.dispose();
    super.onClose();
  }
}
