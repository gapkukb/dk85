import 'package:app/services/index.dart';
import 'package:get/get.dart';
import 'package:app/shared/balance/balance.dart';
import 'package:flutter/material.dart';
import 'package:app/theme/index.dart';

class SimpleBalance extends StatelessWidget {
  final bool depositable;
  const SimpleBalance({super.key, this.depositable = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      padding: const EdgeInsets.all(2),
      decoration: const BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.all(Radius.circular(100))),
      child: Row(
        spacing: 8,
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircleAvatar(radius: 16, foregroundImage: AssetImage("assets/icons/logo-3.webp")),
          buildUser(),
          depositable ? buildButton() : SizedBox(width: 2),
        ],
      ),
    );
  }

  buildUser() {
    return Column(
      // spacing: 4,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          spacing: 4,
          children: [
            const Text(
              "ID:123456",
              style: TextStyle(fontSize: 10, color: Colors.white, fontWeight: FontWeight.normal),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(color: const Color(0xfffffac4), borderRadius: BorderRadius.circular(16)),
              child: Obx(
                () => Text(
                  "VIP${services.user.userInfo.value?.gradeId}",
                  style: TextStyle(
                    fontSize: 8,
                    color: AppColors.primary,
                    // height: 1.2,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
        Balance(spacing: 8, trailing: false, showFraction: false, amountStyle: TextStyle(fontSize: 12)),
      ],
    );
  }

  buildButton() {
    return MaterialButton(
      elevation: 0,
      highlightElevation: 0,
      onPressed: () {},
      minWidth: 78,
      height: 32,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      color: const Color(0xffffeddd),
      child: Text(
        "app.deposit".tr,
        style: const TextStyle(fontSize: 12, color: AppColors.primary, fontWeight: FontWeight.bold),
      ),
    );
  }
}
