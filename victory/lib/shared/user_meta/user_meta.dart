import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../components/button/button.dart';
import '../../components/vip_badge/vip_badge.dart';
import '../../stores/stores.dart';
import '../../theme/theme.dart';
import '../balance/balance.dart';

class VicUserMeta extends StatelessWidget {
  const VicUserMeta({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => stores.auth.authorized ? meta : meta,
    );
  }

  Widget get authButton {
    return VicButton(
      rounded: true,
      height: 36,
      textBold: true,
      text: 'LOG IN | SIGN UP',
      onPressed: () {
        // stores.auth.login();
      },
    );
  }

  Widget get meta {
    return UnconstrainedBox(
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
                      stores.user.info.value.username,
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
            _topUpButton,
          ],
        ),
      ),
    );
  }

  Widget get _topUpButton {
    return VicButton(
      height: 32,
      rounded: true,
      backgroundColor: AppColors.fff0e2,
      color: AppColors.highlight,
      text: 'app.deposit'.tr,
      textBold: true,
      fontSize: 14,
      onPressed: () => stores.app.toFundsPage(),
    );
  }
}
