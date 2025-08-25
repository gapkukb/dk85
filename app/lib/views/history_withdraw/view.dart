import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class HistoryWithdrawView extends GetView<HistoryWithdrawController> {
  const HistoryWithdrawView({super.key});

  // 主视图
  Widget _buildView() {
    return const Center(child: Text("HistoryWithdrawPage"));
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HistoryWithdrawController>(
      init: HistoryWithdrawController(),
      id: "history_withdraw",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("history_withdraw")),
          body: SafeArea(child: _buildView()),
        );
      },
    );
  }
}
