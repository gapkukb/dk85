import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:victory/components/button/button.dart';
import 'package:victory/components/tap_counter/tap_counter.dart';
import 'package:victory/components/vip_badge/vip_badge.dart';
import 'package:victory/helper/native_image.dart';
import 'package:victory/routes/app_pages.dart';
import 'package:victory/services/services.dart';
import 'package:victory/theme/theme.dart';
import 'package:victory/shared/balance/balance.dart';

class VicUserMeta extends StatelessWidget {
  const VicUserMeta({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => services.auth.authorized ? meta : authButton,
    );
  }

  Widget get authButton {
    return VicButton(
      rounded: true,
      height: 36,
      textBold: true,
      text: 'LOG IN | SIGN UP',
      onPressed: () {
        Get.toNamed(AppRoutes.auth);
      },
    );
  }

  Widget get meta {
    return VicTapCounter(
      count: 9,
      onTaps: (count) {
        Get.toNamed(AppRoutes.debug);
      },
      child: Container(
        width: 210,
        height: 36,
        padding: const EdgeInsets.all(2),
        decoration: const BoxDecoration(color: AppColors.primary, borderRadius: AppSizes.radius_a_24),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 16,
              backgroundColor: AppColors.fff0e2,
              backgroundImage: AssetImage('assets/images/default_avatar.webp'),
            ),
            const SizedBox(width: 4),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              // spacing: 4,
              children: [
                Row(
                  spacing: 4,
                  children: [
                    Text(
                      "ID:${services.user.info.value.id}",
                      style: const TextStyle(fontSize: 10, color: AppColors.FFF3C5, height: 1, fontWeight: FontWeight.normal),
                    ),
                    SizedBox(
                      height: 12,
                      child: VipBadge(level: services.user.vipLevel),
                    ),
                  ],
                ),
                VicBalanceBuilder(
                  amountStyle: const TextStyle(height: 1, fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.white),
                  builder: (context, amount, button, _) {
                    return Row(
                      spacing: 4,
                      children: [
                        amount,
                        button,
                      ],
                    );
                  },
                ),
              ],
            ),

            const Spacer(),
            _depositButton,
          ],
        ),
      ),
    );
  }

  Widget get _depositButton {
    return VicButton(
      height: 32,
      rounded: true,
      backgroundColor: AppColors.fff0e2,
      color: AppColors.highlight,
      text: 'app.deposit'.tr,
      textBold: true,
      fontSize: 14,
      onPressed: () => services.app.toFundsPage(),
    );
  }
}
