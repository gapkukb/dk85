import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';
import 'widgets/widgets.dart';

class MePage extends GetView<MeController> {
  const MePage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const HelloWidget();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MeController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("me")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
