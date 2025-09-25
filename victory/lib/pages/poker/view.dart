import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:victory/shared/game/game_page.dart';
import 'package:victory/services/services.dart';
import 'package:victory/pages/poker/index.dart';

class VicPokerPage extends GetView<VicPokerController> {
  const VicPokerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VicPokerController>(
      init: VicPokerController(),
      id: "poker",
      builder: (_) {
        return GamePageView(dataBuilder: () => services.game.poker, adPosition: 4);
      },
    );
  }
}
