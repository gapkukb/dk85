import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../components/back_button/back_button.dart';
import '../../components/state_block/state_block.dart';
import '../../shared/game/game.dart';
import '../../stores/stores.dart';
import '../../theme/size.dart';
import 'index.dart';

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
                  loading: stores.game.likesLoading.value,
                  gameList: controller.games,
                  empty: () => VicStateBlock(buttonText: 'fav.browser'.tr, onPressed: stores.app.toHomePage),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
