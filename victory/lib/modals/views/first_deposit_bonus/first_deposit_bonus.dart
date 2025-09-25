import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:victory/services/services.dart';
import 'package:victory/modals/modal_ainimated_background.dart';
import 'package:victory/modals/views/modal_action_button.dart';
import 'package:victory/modals/views/modal_template.dart';

class VicModalFirstDepositBonus extends StatelessWidget {
  const VicModalFirstDepositBonus({super.key});

  @override
  Widget build(BuildContext context) {
    return VicModalAnimatedBackground(
      child: VicModalTemplate(
        closePosition: (right: 24.0, top: 24),
        padding: const EdgeInsets.all(0),
        margin: 0,
        backgroundColor: Colors.transparent,
        child: Container(
          width: double.infinity,
          height: 500,
          alignment: const Alignment(0, 1),
          decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/images/try-game.webp'), alignment: Alignment(0, -1)),
          ),
          child: VicModalActionButton(
            text: 'Deposit Now',
            onTap: () {
              services.app.toFundsPage();
              Get.back();
            },
          ),
        ),
      ),
    );
  }
}
