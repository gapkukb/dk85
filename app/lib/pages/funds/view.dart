import 'package:flutter/services.dart';

import '../../iconfont/index.dart';
import 'widgets/wallet_channels.dart';
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
        return Scaffold(
          backgroundColor: const Color(0xfff5f5f5),
          appBar: AppBar(
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: AppColors.danger,
              systemStatusBarContrastEnforced: false,
            ),
            automaticallyImplyLeading: false,
            toolbarHeight: 0,
          ),
          body: ListView(
            children: [
              Stack(
                children: [
                  Positioned.fill(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            const Color(0xffff5800).withAlpha(200),
                            Colors.transparent,
                          ],
                          stops: const [0.5, 0.5],
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsetsGeometry.all(8),
                    child: AccountBalance(),
                  ),
                ],
              ),
              buildMenus(),

              Obx(() => buildTabs(controller.isWithdrawal.value)),
              Navigator(
                key: Get.nestedKey(2),
                initialRoute: Routes.DASHBOARD + Routes.FUNDS + Routes.DEPOSIT,
                onGenerateRoute: controller.onGenerateRoute,
              ),
            ],
          ),
        );
      },
    );
  }

  buildTabs(bool isWithdrawal) {
    return Padding(
      padding: const EdgeInsetsGeometry.all(16),
      child: Column(
        children: [
          Row(
            spacing: 8,
            children: [
              buildButton("充值", !isWithdrawal, () {
                controller.changeView(false);
                Get.offAndToNamed(
                  Routes.DASHBOARD + Routes.FUNDS + Routes.DEPOSIT,
                  id: 2,
                );
              }),
              buildButton("提现", isWithdrawal, () {
                controller.changeView(true);
                Get.offAndToNamed(
                  Routes.DASHBOARD + Routes.FUNDS + Routes.WITHDRAWAL,
                  id: 2,
                );
              }),
            ],
          ),
          const Divider(height: 0, color: AppColors.danger, thickness: 0.5),
        ],
      ),
    );
  }

  buildMenus() {
    return Card(
      margin: const EdgeInsets.only(left: 8, right: 8),
      // elevation: 10,
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(4),
      ),
      child: SizedBox(
        height: 96,
        child: GridView(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
          ),
          children: const [
            WalletMenu(IconFont.yinxingqia, "提款账户"),
            WalletMenu(IconFont.jilu2, "交易记录"),
            WalletMenu(IconFont.chongzhijilu, "充提记录"),
            WalletMenu(IconFont.kefu, "联系客服"),
          ],
        ),
      ),
    );
  }

  buildButton(String name, bool filled, VoidCallback onTap) {
    const border = BorderSide(color: AppColors.danger);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        constraints: const BoxConstraints(minWidth: 100),
        height: 32,
        decoration: BoxDecoration(
          color: filled ? AppColors.danger : null,
          border: filled
              ? null
              : const Border(left: border, right: border, top: border),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
        ),
        child: Text(
          "充值",
          style: TextStyle(
            fontSize: 14,
            color: filled ? Colors.white : AppColors.danger,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
