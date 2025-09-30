import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slide_countdown/slide_countdown.dart';
import 'package:victory/apis/apis.dart';
import 'package:victory/extensions/compact.extension.dart';
import 'package:victory/mixins/lucky_wheel.mixin.dart';
import 'package:victory/modals/modals.dart';
import 'package:victory/modals/views/modal_template.dart';
import 'package:victory/services/services.dart';
import '/3rd/roulette/roulette.dart';

part 'lucky_wheel_enter.dart';
part 'lucky_wheel_draw.dart';
part 'lucky_wheel_pending.dart';

class VicModalLuckyWheel extends StatelessWidget {
  const VicModalLuckyWheel({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (services.user.luckyWheelDisplay.value == LuckyWheelDisplay.waiting) {
        return const _LuckyWheelDraw();
      }

      if (services.user.luckyWheelDisplay.value == LuckyWheelDisplay.pending) {
        return const _LuckyWheelPending();
      }

      return const SizedBox.shrink();
    });
  }
}
