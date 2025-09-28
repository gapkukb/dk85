import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:victory/env.dart';
import 'package:victory/iconfont/iconfont.dart';
import 'package:victory/pages/demo/lucky_spin_floating.dart';
import 'package:victory/services/services.dart';
import 'package:victory/shared/talker/talker.dart';
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
    return _RootViewGetX(child: child);
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

              /// 用来放一些全局的挂件
              Obx(() {
                if (services.user.showLotteryPendant.value) return const LuckySpinFloating();
                return const SizedBox.square();
              }),
            ],
          ),
          floatingActionButton: Align(
            alignment: const Alignment(1, 0.85),
            child: FloatingActionButton.small(
              onPressed: () => Get.dialog(TalkerScreen(talker: talker)),
              backgroundColor: Colors.red,
              child: const Icon(IconFont.debug),
            ),
          ),
        );
      },
    );
  }
}
