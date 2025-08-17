import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/custom_app_bar.dart';
import 'index.dart';

class FavoritesView extends GetView<FavoritesController> {
  const FavoritesView({super.key});

  // 主视图
  Widget _buildView() {
    return const Center(child: Text("FavoritesPage"));
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavoritesController>(
      init: Get.put(FavoritesController()),
      id: "favorites",
      builder: (_) {
        return Scaffold(
          appBar: const CustomAppBar(title: "我收藏的游戏"),
          body: SafeArea(child: _buildView()),
        );
      },
    );
  }
}
