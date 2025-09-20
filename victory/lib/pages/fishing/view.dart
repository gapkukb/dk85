import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class FishingPage extends GetView<FishingController> {
  const FishingPage({super.key});

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("FishingPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FishingController>(
      init: FishingController(),
      id: "fishing",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("fishing")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
