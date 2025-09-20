import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class SlotsPage extends GetView<SlotsController> {
  const SlotsPage({super.key});

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("SlotsPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SlotsController>(
      init: SlotsController(),
      id: "slots",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("slots")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
