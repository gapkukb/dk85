import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class PokerPage extends GetView<PokerController> {
  const PokerPage({super.key});

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("PokerPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PokerController>(
      init: PokerController(),
      id: "poker",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("poker")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
