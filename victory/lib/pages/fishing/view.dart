import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared/game/game_page.dart';
import '../../stores/stores.dart';
import 'index.dart';

class VicFishingPage extends GetView<VicFishingController> {
  const VicFishingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VicFishingController>(
      init: VicFishingController(),
      id: "fishing",
      builder: (_) {
        return GamePageView(dataBuilder: () => stores.game.slots, adPosition: 3);
      },
    );
  }
}
