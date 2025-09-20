import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class FundsPage extends StatefulWidget {
  const FundsPage({Key? key}) : super(key: key);

  @override
  State<FundsPage> createState() => _FundsPageState();
}

class _FundsPageState extends State<FundsPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const _FundsViewGetX();
  }
}

class _FundsViewGetX extends GetView<FundsController> {
  const _FundsViewGetX({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("FundsPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FundsController>(
      init: FundsController(),
      id: "funds",
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
