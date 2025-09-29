import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:restart_app/restart_app.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:victory/constants/lucky_spin.dart';
import 'package:victory/env.dart';
import 'package:victory/helper/toast.dart';
import 'package:victory/iconfont/iconfont.dart';
import 'package:victory/pages/demo/lucky_spin_floating.dart';
import 'package:victory/services/services.dart';
import 'package:victory/shared/dialogs/dialog.dart';
import 'package:victory/shared/logger/logger.dart';
import 'package:victory/shared/talker/talker.dart';
import 'package:victory/startup/bot_toast.dart';
import 'package:victory/storage/storage.dart';

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

  LuckySpinDisplay get display => services.user.luckySpinDisplay.value;

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
                if (display == LuckySpinDisplay.none) return const SizedBox.square();
                return Positioned(
                  right: 0,
                  bottom: 80,
                  child: Offstage(
                    offstage: display == LuckySpinDisplay.waiting || display == LuckySpinDisplay.pending,
                    child: const LuckySpinFloating(),
                  ),
                );
              }),
            ],
          ),
          floatingActionButton: Align(
            alignment: const Alignment(-0.9, 0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FloatingActionButton.small(
                  onPressed: () => Get.dialog(TalkerScreen(talker: talker)),
                  backgroundColor: Colors.red,
                  child: const Icon(IconFont.debug),
                ),
                debugEntry,
              ],
            ),
          ),
        );
      },
    );
  }

  Widget get debugEntry {
    return FloatingActionButton.small(
      onPressed: () => VicDialog.confirm(
        confirmText: '点击重启生效',
        child: debug,
        onConfirm: () async {
          final host = controller.debugger.text.split(':');
          try {
            await storage.proxyHost.update(host[0]);
            await storage.proxyPort.update(int.parse(host[1]));
            Restart.restartApp();
          } catch (e) {
            toast('非法host');
          }
        },
      ),
      backgroundColor: Colors.green,
      child: const Icon(Symbols.wifi),
    );
  }

  Widget get debug {
    final c = Get.find<RootController>();
    return TextField(
      controller: c.debugger,
      decoration: const InputDecoration(
        hintText: '输入代理的IP地址和端口',
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(),
      ),
    );
  }
}
