import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared/game/game_page.dart';
import '../../stores/stores.dart';
import 'index.dart';

class PokerPage extends GetView<PokerController> {
  const PokerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PokerController>(
      init: PokerController(),
      id: "poker",
      builder: (_) {
        return GamePageView(dataBuilder: () => stores.game.slots, adPosition: 4);
      },
    );
  }
}
