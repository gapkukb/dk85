import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../models/models.dart';
import 'game_section.dart';
import 'game_swiper.dart';

class GamePageView extends StatefulWidget {
  final List<Game> Function() dataBuilder;
  final int adPosition;

  const GamePageView({super.key, required this.dataBuilder, required this.adPosition});

  @override
  _GamePageViewState createState() => _GamePageViewState();
}

class _GamePageViewState extends State<GamePageView> with AutomaticKeepAliveClientMixin {
  List<Game> get games => widget.dataBuilder();

  final refresher = RefreshController();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverGameSwiper(position: widget.adPosition),
          // Obx(() => SliverGameSection("Hot Games", games.hotGames)),
          // Obx(() => SliverGameSection("New Games", games.newGames)),
          Obx(() => VicGameSection("game.all".tr, games)),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    refresher.dispose();
    super.dispose();
  }
}
