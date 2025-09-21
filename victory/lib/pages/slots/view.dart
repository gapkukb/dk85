import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared/game/game_page.dart';
import '../../stores/stores.dart';
import 'index.dart';

class SlotsPage extends GetView<SlotsController> {
  const SlotsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SlotsController>(
      init: SlotsController(),
      id: "slots",
      builder: (_) {
        return GamePageView(dataBuilder: () => stores.game.slots, adPosition: 2);
      },
    );
  }
}
