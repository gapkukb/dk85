import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:victory/components/state_block/state_block.dart';
import 'package:victory/shared/game/game.dart';
import 'package:victory/pages/search/index.dart';
import 'package:victory/pages/search/widgets/widgets.dart';

class VicSearchPage extends GetView<VicSearchController> {
  const VicSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VicSearchController>(
      builder: (_) {
        return Scaffold(
          appBar: const SearchingBar(),
          body: SafeArea(
            child: Obx(() {
              if (controller.filteredGames.isEmpty) {
                return const VicStateBlock();
              }
              return GridView.builder(
                key: ValueKey(controller.keywords + controller.kind.toString()),
                padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
                itemCount: controller.filteredGames.length,
                gridDelegate: VicGameGrid.delegate,
                itemBuilder: (context, index) {
                  return VicGameCard(game: controller.filteredGames[index]);
                },
              );
            }),
          ),
        );
      },
    );
  }
}
