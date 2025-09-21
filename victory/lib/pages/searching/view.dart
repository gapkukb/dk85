import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/state_block/state_block.dart';
import '../../shared/game/game.dart';
import 'index.dart';
import 'widgets/widgets.dart';

class SearchingPage extends GetView<SearchingController> {
  const SearchingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchingController>(
      builder: (_) {
        return Scaffold(
          appBar: const SearchingBar(),
          body: SafeArea(
            child: Obx(() {
              if (controller.filteredGames.isEmpty) {
                return const StateBlock();
              }
              return GridView.builder(
                key: ValueKey(controller.keywords + controller.kind.toString()),
                padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
                itemCount: controller.filteredGames.length,
                gridDelegate: VicGameGrid.delegate,
                itemBuilder: (context, index) {
                  return VicGameItem(game: controller.filteredGames[index]);
                },
              );
            }),
          ),
        );
      },
    );
  }
}
