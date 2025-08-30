import 'package:app/widgets/back_button/back_button.dart';
import 'package:app/widgets/game/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'index.dart';

class FavoritesView extends GetView<FavoritesController> {
  const FavoritesView({super.key});

  // 主视图

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavoritesController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            leading: AKBackButton(),
            title: Text("page.favorites".tr),
          ),
          body: SafeArea(child: GameGridView(gameList: [])),
        );
      },
    );
  }
}
