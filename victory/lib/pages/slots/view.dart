import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:victory/shared/game/game_page.dart';
import 'package:victory/services/services.dart';
import 'package:victory/pages/slots/index.dart';

class VicSlotsPage extends GetView<VicSlotsController> {
  const VicSlotsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VicSlotsController>(
      init: VicSlotsController(),
      id: "slots",
      builder: (_) {
        return GamePageView(dataBuilder: () => services.game.slots, adPosition: 2);
      },
    );
  }
}
