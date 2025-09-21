import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared/game/game_page.dart';
import '../../stores/stores.dart';
import 'index.dart';

class FishingPage extends GetView<FishingController> {
  const FishingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FishingController>(
      init: FishingController(),
      id: "fishing",
      builder: (_) {
        return GamePageView(dataBuilder: () => stores.game.slots, adPosition: 3);
      },
    );
  }
}
