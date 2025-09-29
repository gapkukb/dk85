import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:slide_countdown/slide_countdown.dart';
import 'package:victory/3rd/text_with_border.dart';
import 'package:victory/constants/lucky_spin.dart';
import 'package:victory/modals/modals.dart';
import 'package:victory/modals/views/lucky_spin/view_next.dart';
import 'package:victory/services/services.dart';

class LuckySpinFloating extends StatefulWidget {
  const LuckySpinFloating({super.key});

  @override
  _LuckySpinFloatingState createState() => _LuckySpinFloatingState();
}

class _LuckySpinFloatingState extends State<LuckySpinFloating> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (services.user.luckySpinDisplay.value == LuckySpinDisplay.miniWating) {
          VicModals.shared.show(VicModalName.lucky_spin);
          services.user.luckySpinDisplay.value = LuckySpinDisplay.waiting;
        } else {
          VicModals.shared.show(VicModalName.lucky_spin_next);
          services.user.luckySpinDisplay.value = LuckySpinDisplay.pending;
        }
      },
      child: Container(
        width: 128 / 2,
        height: 146 / 2,
        alignment: const Alignment(0, 1),
        decoration: const BoxDecoration(
          // color: Colors.yellow,
          image: DecorationImage(
            image: AssetImage('assets/images/lucky_spin_main.webp'),
            alignment: Alignment.topCenter,
            // fit: BoxFit.fitWidth,
            // scale: 11,
          ),
        ),
        child: countdown,
      ),
    );
  }

  Widget buildRedText(String text) {
    return StrokeText(
      text: text,
      textStyle: const TextStyle(fontSize: 14, color: Colors.white),
      strokePartterns: [
        const StrokeParttern(Colors.black, 6),
        const StrokeParttern(Colors.red, 4),
        const StrokeParttern(Colors.black, 2),
      ],
    );
  }

  Widget buildYellowText(String text) {
    return StrokeText(
      text: text,
      textStyle: const TextStyle(fontSize: 14, color: Colors.white),
      strokePartterns: [
        const StrokeParttern(Colors.black, 6),
        const StrokeParttern(Color(0xffffe924), 4),
        const StrokeParttern(Colors.black, 2),
      ],
    );
  }

  Widget get countdown {
    return Obx(
      () => SlideCountdown(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 0),
        shouldShowDays: (_) => false,
        separator: ':',
        separatorPadding: const EdgeInsets.all(0),
        separatorStyle: const TextStyle(
          fontSize: 11,
          color: Colors.black,
          // letterSpacing: -,
          fontWeight: FontWeight.bold,
        ),
        style: const TextStyle(
          fontSize: 11,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        decoration: BoxDecoration(
          color: const Color(0xfffff421),
          border: Border.all(color: const Color(0xff898200), width: 2),
          borderRadius: const BorderRadius.all(Radius.circular(24)),
        ),
        duration: services.user.luckySpinCountdown.value,
      ),
    );
  }
}
