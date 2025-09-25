import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:victory/shared/game/game_section.dart';
import 'package:victory/shared/game/game_swiper.dart';
import 'package:victory/pages/hot/index.dart';

class VicHotPage extends GetView<VicHotController> {
  const VicHotPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VicHotController>(
      init: VicHotController(),
      id: "hot",
      builder: (_) {
        return Scaffold(
          body: SafeArea(
            child: CustomScrollView(
              slivers: [
                const SliverGameSwiper(position: 1),
                Obx(() => VicGameSection("game.hot".tr, controller.hotGames.value)),
                Obx(() => VicGameSection("game.news".tr, controller.newGames.value)),
              ],
            ),
          ),
        );
      },
    );
  }
}
