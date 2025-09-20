import 'package:floating_draggable_widget/floating_draggable_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:restart_app/restart_app.dart';
import 'package:talker_flutter/talker_flutter.dart';

import '../iconfont/iconfont.dart';

class DebugView extends StatefulWidget {
  static bool enbale = false;
  final Widget child;
  const DebugView({super.key, required this.child});

  @override
  _DebugViewState createState() => _DebugViewState();
}

class _DebugViewState extends State<DebugView> {
  final talker = TalkerFlutter.init();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingDraggableWidget(
      mainScreenWidget: Scaffold(
        body: widget.child,
      ),
      floatingWidgetWidth: 64,
      floatingWidgetHeight: 64,
      autoAlign: true,
      floatingWidget: FloatingActionButton.small(
        child: const Icon(IconFont.debug),
        onPressed: () {
          // showAsking();
          // Get.dialog(TalkerScreen(talker: talker));
          Get.toNamed('/about');
        },
      ),
    );
  }

  static void showAsking() async {
    final controller = TextEditingController();

    await Get.defaultDialog(
      title: '输入密码',
      buttonColor: Colors.red,
      titleStyle: const TextStyle(fontSize: 14),
      content: TextField(
        controller: controller,
        decoration: const InputDecoration(helperText: 'APP将重新启动'),
      ),
      textCancel: '取消',
      textConfirm: '确认',
      onConfirm: () {
        Restart.restartApp();
      },
    );

    controller.dispose();
  }
}
