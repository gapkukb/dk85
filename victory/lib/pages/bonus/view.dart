import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class BonusPage extends StatefulWidget {
  const BonusPage({Key? key}) : super(key: key);

  @override
  State<BonusPage> createState() => _BonusPageState();
}

class _BonusPageState extends State<BonusPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const _BonusViewGetX();
  }
}

class _BonusViewGetX extends GetView<BonusController> {
  const _BonusViewGetX({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("BonusPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BonusController>(
      init: BonusController(),
      id: "bonus",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("bonus")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
