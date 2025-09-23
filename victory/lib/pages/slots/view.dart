import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared/game/game_page.dart';
import '../../stores/stores.dart';
import 'index.dart';

class VicSlotsPage extends GetView<VicSlotsController> {
  const VicSlotsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VicSlotsController>(
      init: VicSlotsController(),
      id: "slots",
      builder: (_) {
        return GamePageView(dataBuilder: () => stores.game.slots, adPosition: 2);
      },
    );
  }
}
