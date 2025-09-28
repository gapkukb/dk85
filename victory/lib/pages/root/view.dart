import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:victory/iconfont/iconfont.dart';
import 'package:victory/pages/demo/lucky_spin_floating.dart';
import 'package:victory/services/services.dart';
import 'package:victory/startup/bot_toast.dart';

import 'index.dart';

class RootView extends StatefulWidget {
  final Widget child;
  const RootView({super.key, required this.child});

  @override
  State<RootView> createState() => _RootViewState();
}

class _RootViewState extends State<RootView> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  late Widget child;

  @override
  void initState() {
    child = setupBotToast(context, widget.child);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return _RootViewGetX(child: widget.child);
  }
}

class _RootViewGetX extends GetView<RootController> {
  final Widget child;
  const _RootViewGetX({required this.child});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RootController>(
      init: RootController(),
      id: "root",
      builder: (_) {
        return Scaffold(
          body: Stack(
            children: [
              child,
              Obx(() {
                if (services.user.showLotteryPendant.value) return const LuckySpinFloating();
                return const SizedBox.square();
              }),
            ],
          ),
          floatingActionButton: FloatingActionButton.small(
            onPressed: () {},
            backgroundColor: Colors.red,
            child: const Icon(IconFont.debug),
          ),
        );
      },
    );
  }
}
