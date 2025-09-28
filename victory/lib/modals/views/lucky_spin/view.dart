import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/3rd/roulette/roulette.dart';
import 'package:victory/modals/views/modal_template.dart';
import 'index.dart';

class VicModalLuckySpin extends StatefulWidget {
  const VicModalLuckySpin({super.key});

  @override
  State<VicModalLuckySpin> createState() => _VicModalLuckySpinState();
}

class _VicModalLuckySpinState extends State<VicModalLuckySpin> {
  final controller = RouletteController();
  final length = 6;
  var doing = false;
  late final RouletteGroup group;

  @override
  void initState() {
    group = RouletteGroup.uniform(
      length,
      colorBuilder: (index) => Colors.transparent,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final random = Random();
    return VicModalTemplate(
      padding: const EdgeInsets.all(0),
      backgroundColor: Colors.transparent,
      title: 'Free Spin',
      subtitle: 'The more you charge, the more you get',
      buttoText: 'Try Now',
      onButtonTap: () async {
        if (doing) return;
        doing = true;
        await controller.rollTo(
          Random().nextInt(6),
          clockwise: true,
          offset: random.nextDouble(),
        );
        doing = false;
      },
      child: Container(
        padding: const EdgeInsets.only(top: 60),
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/lucky_spin_bg.webp'), fit: BoxFit.fitWidth, alignment: Alignment(0, -1)),
        ),
        child: AspectRatio(
          aspectRatio: 1,
          child: Roulette(
            backgroundImage: const AssetImage('assets/images/lucky_spin_main.webp'),
            group: group,
            // Provide controller to update its state
            controller: controller,
            // Configure roulette's appearance
            style: const RouletteStyle(
              dividerThickness: 0.0,
              dividerColor: Colors.transparent,
              centerStickSizePercent: 0.0,
              centerStickerColor: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
