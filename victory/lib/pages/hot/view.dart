import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class HotPage extends GetView<HotController> {
  const HotPage({super.key});

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("HotPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HotController>(
      init: HotController(),
      id: "hot",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("hot")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
