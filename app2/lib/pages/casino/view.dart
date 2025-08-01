import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';
import 'widgets/widgets.dart';

class CasinoPage extends GetView<CasinoController> {
  const CasinoPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const HelloWidget();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CasinoController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("casino")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
