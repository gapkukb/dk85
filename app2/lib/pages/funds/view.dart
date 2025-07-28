import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';
import 'widgets/widgets.dart';

class FundsPage extends GetView<FundsController> {
  const FundsPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const HelloWidget();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FundsController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("funds")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
