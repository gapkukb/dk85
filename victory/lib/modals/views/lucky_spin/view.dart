import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:victory/modals/views/lucky_spin/view_init.dart';
import 'package:victory/modals/views/lucky_spin/view_next.dart';
import 'package:victory/services/services.dart';

class VicModalLuckySpin extends StatelessWidget {
  const VicModalLuckySpin({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => services.user.luckySpinDisplay.value == 0 ? const VicModalLuckySpinInit() : const VicModalLuckySpinNext(),
    );
  }
}
