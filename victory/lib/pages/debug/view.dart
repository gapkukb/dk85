import 'package:floating_draggable_widget/floating_draggable_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:restart_app/restart_app.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'package:victory/iconfont/iconfont.dart';
import 'package:victory/shared/dialogs/dialog.dart';
import 'package:victory/shared/talker/talker.dart';

class DebugView extends StatefulWidget {
  static bool enbale = false;
  final Widget child;
  const DebugView({super.key, required this.child});

  @override
  _DebugViewState createState() => _DebugViewState();
}

class _DebugViewState extends State<DebugView> {
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
      floatingWidgetWidth: 36,
      floatingWidgetHeight: 36,
      autoAlign: true,
      dx: 0,
      dy: MediaQuery.of(context).size.height - 36,
      floatingWidget: FloatingActionButton.small(
        backgroundColor: Colors.red,
        heroTag: 'debug',
        child: const Icon(IconFont.debug),
        onPressed: () {
          Get.dialog(TalkerScreen(talker: talker));
        },
      ),
    );
  }
}
