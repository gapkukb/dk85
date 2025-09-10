import 'package:app/theme/index.dart';
import 'package:app/views_modal/base_modal/base_modal.dart';
import 'package:app/widgets/button/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class GameTrialModal extends StatelessWidget {
  const GameTrialModal({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseModal(
      backgroundColor: Colors.transparent,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/images/try-game.webp"), fit: BoxFit.fitWidth, alignment: Alignment(0, -0.5)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 270),
          Text(
            "Try this game",
            style: TextStyle(fontSize: 32, color: AppColors.white, fontWeight: FontWeight.bold),
          ),
          Text("Experience the pinnacle of the game", style: TextStyle(fontSize: 16, color: AppColors.white)),
          SizedBox(height: 24),
          AKButton(
            onPressed: () {},
            minWidth: Get.width - 96,
            rounded: true,
            child: Text('Try Game', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
