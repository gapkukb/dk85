import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:victory/shared/game/game_page.dart';
import 'package:victory/services/services.dart';
import 'package:victory/pages/fishing/index.dart';

class VicFishingPage extends GetView<VicFishingController> {
  const VicFishingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VicFishingController>(
      init: VicFishingController(),
      id: "fishing",
      builder: (_) {
        return GamePageView(dataBuilder: () => services.game.slots, adPosition: 3);
      },
    );
  }
}
