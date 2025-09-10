import 'package:app/theme/index.dart';
import 'package:app/views_modal/base_modal/base_modal.dart';
import 'package:app/widgets/button/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class TopUpBonusModal extends StatelessWidget {
  const TopUpBonusModal({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseModal(
      backgroundColor: Colors.transparent,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/images/deposit-bonus.webp"), fit: BoxFit.fitWidth, alignment: Alignment(0, -0.5)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 270),
          Text(
            "Deposit received",
            style: TextStyle(fontSize: 32, color: AppColors.white, fontWeight: FontWeight.bold),
          ),
          Text("Experience the pinnacle of the game", style: TextStyle(fontSize: 16, color: AppColors.white)),
          SizedBox(height: 24),
          AKButton(
            onPressed: () {},
            minWidth: Get.width - 96,
            rounded: true,
            child: Text('GO', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
