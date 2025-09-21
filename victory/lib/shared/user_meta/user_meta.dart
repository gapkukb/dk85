import 'package:expand_tap_area/expand_tap_area.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:animate_do/animate_do.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import '../../components/button/button.dart';
import '../../components/vip_badge/vip_badge.dart';
import '../../iconfont/iconfont.dart';
import '../../stores/stores.dart';
import '../../styles/styles.dart';
import '../balance/balance.dart';

class UserMeta extends StatelessWidget {
  const UserMeta({Key? key}) : super(key: key);

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
      text: 'SIGN IN | SIGN UP',
      onPressed: () {
        stores.auth.login();
      },
    );
  }

  Widget get meta {
    final n = 'sdf13f';
    return UnconstrainedBox(
      child: Container(
        height: 36,
        padding: const EdgeInsets.all(2),
        decoration: const BoxDecoration(color: AppColor.primary, borderRadius: AppSize.radius_a_24),
        child: Row(
          spacing: 8,
          children: [
            const CircleAvatar(
              radius: 16,
              backgroundColor: AppColor.fff0e2,
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
                      n,
                      style: const TextStyle(fontSize: 10, color: AppColor.white, height: 1),
                    ),
                    const SizedBox(
                      height: 12,
                      child: VipBadge(level: 1),
                    ),
                  ],
                ),
                Balance(
                  showFraction: false,
                  amountStyle: const TextStyle(height: 1, fontSize: 12, fontWeight: FontWeight.bold, color: AppColor.white),
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
      backgroundColor: AppColor.fff0e2,
      color: AppColor.highlight,
      text: 'app.deposit'.tr,
      textBold: true,
      fontSize: 14,
      onPressed: () => stores.app.toFundsPage(),
    );
  }
}
