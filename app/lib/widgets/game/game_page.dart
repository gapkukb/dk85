import 'package:app/apis/index.dart';
import 'package:app/helper/group_games.dart';
import 'package:app/models/ad_list.model.dart';
import 'package:app/models/game.model.dart';
import 'package:app/services/index.dart';
import 'package:app/widgets/game/game_section.dart';
import 'package:app/widgets/game/game_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class GamePageView extends StatefulWidget {
  final List<GameModel> Function() dataBuilder;
  final int adPosition;

  const GamePageView({
    super.key,
    required this.dataBuilder,
    required this.adPosition,
  });

  @override
  _GamePageViewState createState() => _GamePageViewState();
}

class _GamePageViewState extends State<GamePageView>
    with AutomaticKeepAliveClientMixin {
  List<GameModel> get games => widget.dataBuilder();

  final refresher = RefreshController();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: SmartRefresher(
        controller: refresher,
        onRefresh: GameService.to.onRefresh,
        child: CustomScrollView(
          slivers: [
            SliverGameSwiper(position: widget.adPosition),
            // Obx(() => SliverGameSection("Hot Games", games.hotGames)),
            // Obx(() => SliverGameSection("New Games", games.newGames)),
            Obx(() => SliverGameSection("All Games", games)),
          ],
        ),
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
