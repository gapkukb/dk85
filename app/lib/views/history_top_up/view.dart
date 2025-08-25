import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class HistoryTopUpView extends GetView<HistoryTopUpController> {
  const HistoryTopUpView({super.key});

  // 主视图
  Widget _buildView() {
    return const Center(child: Text("HistoryTopUpPage"));
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HistoryTopUpController>(
      init: HistoryTopUpController(),
      id: "history_top_up",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("history_top_up")),
          body: SafeArea(child: _buildView()),
        );
      },
    );
  }
}
