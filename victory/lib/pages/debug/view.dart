import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:victory/components/button/button.dart';
import 'package:victory/iconfont/iconfont.dart';
import 'package:victory/pages/debug/settings.dart';
import 'package:victory/shared/talker/talker.dart';

class DebugView extends StatefulWidget {
  const DebugView({super.key});

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
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 8,
      children: [
        VicButton(
          width: 36,
          height: 36,
          rounded: true,
          backgroundColor: Colors.red,
          iconData: Symbols.cast_connected_rounded,
          onPressed: () => Get.dialog(const DebugSettings()),
        ),
        VicButton(
          width: 36,
          height: 36,
          rounded: true,
          backgroundColor: Colors.cyan,
          iconData: IconFont.debug,
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => TalkerScreen(talker: talker),
            ),
          ),
        ),
      ],
    );
  }
}
