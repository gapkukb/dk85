import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/3rd/roulette/roulette.dart';
import 'package:victory/modals/views/modal_template.dart';
import 'index.dart';

class VicModalLuckySpin extends GetView<LuckySpinController> {
  const VicModalLuckySpin({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LuckySpinController>(
      init: LuckySpinController(),
      id: "lucky_spin",
      builder: (_) {
        bool clockwise = true;

        final colors = <Color>[
          Colors.red.withAlpha(50),
          Colors.green.withAlpha(30),
          Colors.blue.withAlpha(70),
          Colors.yellow.withAlpha(90),
          Colors.amber.withAlpha(50),
          Colors.indigo.withAlpha(70),
        ];

        final icons = <IconData>[
          Icons.ac_unit,
          Icons.access_alarm,
          Icons.access_time,
          Icons.accessibility,
          Icons.account_balance,
          Icons.account_balance_wallet,
        ];

        final images = <ImageProvider>[
          // Use [AssetImage] if you have 2.0x, 3.0x images,
          // We only have 1 exact image here
          const NetworkImage("https://picsum.photos/seed/example1/400", scale: 0.5),
          const NetworkImage("https://picsum.photos/seed/example2/400"),
          const NetworkImage("https://picsum.photos/seed/example3/400"),
          const NetworkImage("https://picsum.photos/seed/example4/400"),
          const NetworkImage("https://picsum.photos/seed/example5/400"),
          const NetworkImage("https://picsum.photos/seed/example6/400"),
          // MemoryImage(...)
          // FileImage(...)
          // ResizeImage(...)
        ];

        late final group = RouletteGroup.uniform(
          colors.length,
          colorBuilder: (index) => Colors.transparent,
          // imageBuilder: (index) => images[index],
          textBuilder: (index) {
            if (index == 0) return 'Hi';
            return '25\n00\n05\n00\n\uFFE8\u00A0';
          },
          // styleBuilder: (_) => const TextStyle(color: Colors.amber, height: 1, letterSpacing: 3, fontSize: 20),
          // textStyleBuilder: (index) {
          //   return const TextStyle(color: Colors.amber, height: 1, letterSpacing: 3, fontSize: 20);
          // },
          // styleBuilder: (index) {
          //   return const TextStyle(color: Colors.black);
          // },
        );
        final random = Random();
        return VicModalTemplate(
          child: GestureDetector(
            onTap: () => controller.controller.rollTo(
              Random().nextInt(images.length),
              clockwise: clockwise,
              offset: random.nextDouble(),
            ),
            child: DecoratedBox(
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/images/lucky_spin_main.webp'), fit: BoxFit.cover),
              ),
              child: Roulette(
                group: group,
                // Provide controller to update its state
                controller: controller.controller,
                // Configure roulette's appearance
                style: const RouletteStyle(
                  dividerThickness: 0.0,
                  dividerColor: Colors.black,
                  centerStickSizePercent: 0.05,
                  centerStickerColor: Colors.black,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
