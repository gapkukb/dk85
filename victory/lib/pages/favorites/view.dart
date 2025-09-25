import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:victory/components/back_button/back_button.dart';
import 'package:victory/components/state_block/state_block.dart';
import 'package:victory/shared/game/game.dart';
import 'package:victory/services/services.dart';
import 'package:victory/theme/size.dart';
import 'package:victory/pages/favorites/index.dart';

class VicFavPage extends GetView<VicFavController> {
  const VicFavPage({super.key});

  // 主视图

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VicFavController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(leading: const VicBackButton(), title: Text("fav.title".tr)),
          body: Padding(
            padding: AppSizes.pad_page,
            child: SafeArea(
              child: Obx(
                () => VicGameGrid(
                  loading: services.game.likesLoading.value,
                  gameList: controller.games,
                  empty: () => VicStateBlock(buttonText: 'fav.browser'.tr, onPressed: services.app.toHomePage),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
