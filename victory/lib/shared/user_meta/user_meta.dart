import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:victory/components/button/button.dart';
import 'package:victory/components/tap_counter/tap_counter.dart';
import 'package:victory/components/vip_badge/vip_badge.dart';
import 'package:victory/routes/app_pages.dart';
import 'package:victory/services/services.dart';
import 'package:victory/theme/theme.dart';
import 'package:victory/shared/balance/balance.dart';
import 'package:victory/shared/logger/logger.dart';

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
    return UnconstrainedBox(
      child: VicTapCounter(
        count: 9,
        onTaps: (count) {
          Get.toNamed(AppRoutes.debug);
        },
        child: Container(
          height: 36,
          padding: const EdgeInsets.all(2),
          decoration: const BoxDecoration(color: AppColors.primary, borderRadius: AppSizes.radius_a_24),
          child: Row(
            spacing: 8,
            children: [
              const CircleAvatar(
                radius: 16,
                backgroundColor: AppColors.fff0e2,
                backgroundImage: AssetImage('assets/icons/logo-3.webp'),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                // spacing: 4,
                children: [
                  Row(
                    spacing: 4,
                    children: [
                      Text(
                        services.user.info.value.username,
                        style: const TextStyle(fontSize: 10, color: AppColors.FFF3C5, height: 1, fontWeight: FontWeight.normal),
                      ),
                      const SizedBox(
                        height: 12,
                        child: VipBadge(level: 1),
                      ),
                    ],
                  ),
                  VicBalanceBuilder(
                    showFraction: false,
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
              _depositButton,
            ],
          ),
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
