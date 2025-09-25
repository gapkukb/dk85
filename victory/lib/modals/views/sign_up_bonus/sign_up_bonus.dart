import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:victory/services/services.dart';
import 'package:victory/modals/modal_ainimated_background.dart';
import 'package:victory/modals/views/modal_action_button.dart';
import 'package:victory/modals/views/modal_template.dart';

class VicModalSignUpBonus extends StatelessWidget {
  const VicModalSignUpBonus({super.key});

  @override
  Widget build(BuildContext context) {
    return VicModalAnimatedBackground(
      alignment: const Alignment(0, -0.2),
      child: VicModalTemplate(
        margin: 0,
        padding: const EdgeInsets.all(0),
        backgroundColor: Colors.transparent,
        child: Container(
          width: double.infinity,
          height: 424,
          alignment: const Alignment(0, 1),
          decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/images/deposit-bonus.webp'), alignment: Alignment(0, -1)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "88 FOR FREE",
                style: TextStyle(fontSize: 46, color: Color(0xffFFF422), fontWeight: FontWeight.bold, height: 1),
              ),
              const Text(
                "Sign up to get a bonus",
                style: TextStyle(fontSize: 18, color: Color(0xffFFF422), fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              VicModalActionButton(
                text: 'Login Now',
                onTap: () {
                  services.app.toFundsPage();
                  Get.back();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
