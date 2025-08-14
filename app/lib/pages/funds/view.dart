import 'package:flutter/services.dart';
import '../../iconfont/index.dart';
import '../../widgets/service_calling.dart';
import 'widgets/wallet_menu.dart';
import '../../routes/app_pages.dart';
import '../../theme/index.dart';
import '../../widgets/account_balance.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class FundsPage extends GetView<FundsController> {
  const FundsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FundsController>(
      builder: (_) {
        return SafeArea(
          child: Scaffold(
            // appBar: AppBar(
            //   scrolledUnderElevation: 0,
            //   automaticallyImplyLeading: false,
            //   title: Text("page.funds".tr, style: const TextStyle(fontWeight: FontWeight.bold)),
            // ),
            body: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text("page.funds".tr, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 28)),
                ),
                buildBalance(),
                const SizedBox(height: 24),
                buildMenus(),
                const SizedBox(height: 24),
                Obx(() => buildTabs(controller.isWithdrawal.value)),
                Navigator(key: Get.nestedKey(2), initialRoute: Routes.DASHBOARD + Routes.FUNDS + Routes.DEPOSIT, onGenerateRoute: controller.onGenerateRoute),
              ],
            ),
          ),
        );
      },
    );
  }

  buildBalance() {
    return Container(
      height: 116,
      margin: const EdgeInsets.symmetric(horizontal: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        image: const DecorationImage(image: AssetImage("assets/images/balance-bg.png"), fit: BoxFit.fitWidth, alignment: Alignment(0.5, 0.5)),
        gradient: RadialGradient(colors: [AppColors.primary.withAlpha(50), AppColors.primary], radius: 1.6, center: const Alignment(-0.5, -3)),
      ),
      child: DefaultTextStyle(
        style: const TextStyle(color: Colors.white),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 8,
              children: [
                Text(
                  "app.balance".tr,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                const Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "700000",
                        style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: " MMK", style: TextStyle(fontSize: 24)),
                    ],
                  ),
                ),
              ],
            ),
            const Positioned(right: 12, top: 12, child: Icon(IconFont.refresh, color: Colors.white)),
          ],
        ),
      ),
    );
  }

  buildTabs(bool isWithdrawal) {
    return Padding(
      padding: const EdgeInsetsGeometry.all(12),
      child: Column(
        children: [
          Row(
            spacing: 8,
            children: [
              buildButton("app.deposit".tr, !isWithdrawal, () {
                controller.changeView(false);
                Get.offAndToNamed(Routes.DASHBOARD + Routes.FUNDS + Routes.DEPOSIT, id: 2);
              }),
              buildButton("app.withdraw".tr, isWithdrawal, () {
                controller.changeView(true);
                Get.offAndToNamed(Routes.DASHBOARD + Routes.FUNDS + Routes.WITHDRAWAL, id: 2);
              }),
            ],
          ),
          const Divider(height: 0, color: AppColors.primary, thickness: 0.5),
        ],
      ),
    );
  }

  buildMenus() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: SizedBox(
        height: 90,
        child: GridView(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4, childAspectRatio: 1 / 2),
          children: [
            WalletMenu(IconFont.zidongqukuanji, "funds.account".tr, to: Routes.CUSTOMER_SERVICE),
            WalletMenu(IconFont.yuyuejilu, "game.history".tr, to: Routes.CUSTOMER_SERVICE),
            WalletMenu(IconFont.genzongjilu, "funds.history".tr, to: Routes.CUSTOMER_SERVICE),
            WalletMenu(IconFont.kefu, "page.service".tr, to: Routes.CUSTOMER_SERVICE),
          ],
        ),
      ),
    );
  }

  buildButton(String name, bool filled, VoidCallback onTap) {
    const border = BorderSide(color: AppColors.primary);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        constraints: const BoxConstraints(minWidth: 100),
        height: 32,
        decoration: BoxDecoration(
          color: filled ? AppColors.primary : null,
          border: filled ? null : const Border(left: border, right: border, top: border),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
        ),
        child: Text(
          name,
          style: TextStyle(fontSize: 14, color: filled ? Colors.white : AppColors.primary, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
