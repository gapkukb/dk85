import 'package:app/services/index.dart';
import 'package:app/theme/index.dart';
import 'package:app/widgets/back_button/back_button.dart';
import 'package:app/widgets/game/index.dart';
import 'package:app/widgets/state_block/state_block.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'index.dart';

class FavoritesView extends GetView<FavoritesController> {
  const FavoritesView({super.key});

  // 主视图

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavoritesController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(leading: AKBackButton(), title: Text("fav.title".tr)),
          body: Padding(
            padding: Gutter.horizontal.normal,
            child: SafeArea(
              child: Obx(
                () => GameGridView(
                  loading: controller.loading.value,
                  gameList: services.game.likes,
                  empty: () => StateBlock(buttonText: 'fav.browser'.tr, onPressed: services.app.toDashboardView),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
