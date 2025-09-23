import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared/game/game_page.dart';
import '../../stores/stores.dart';
import 'index.dart';

class VicPokerPage extends GetView<VicPokerController> {
  const VicPokerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VicPokerController>(
      init: VicPokerController(),
      id: "poker",
      builder: (_) {
        return GamePageView(dataBuilder: () => stores.game.slots, adPosition: 4);
      },
    );
  }
}
