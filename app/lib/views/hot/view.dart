import 'package:app/helper/group_games.dart';
import 'package:app/services/index.dart';
import 'package:app/widgets/game/game_section.dart';
import 'package:app/widgets/game/game_swiper.dart';
import 'package:app/widgets/game/index.dart';
import 'package:app/widgets/network_picture.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'index.dart';

class HotView extends StatefulWidget {
  const HotView({super.key});

  @override
  _HotViewState createState() => _HotViewState();
}

class _HotViewState extends State<HotView> with AutomaticKeepAliveClientMixin {
  final controller = HotController();

  GroupGames get games => GroupGames(services.game.all);

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: SafeArea(
        child: SmartRefresher(
          controller: controller.refresher,
          child: CustomScrollView(
            slivers: [SliverGameSwiper(position: 1), Obx(() => SliverGameSection("Hot Games", games.hotGames)), Obx(() => SliverGameSection("New Games", games.newGames))],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
