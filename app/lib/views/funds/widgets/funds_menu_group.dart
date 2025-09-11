import 'package:app/iconfont/index.dart';
import 'package:app/routes/app_pages.dart';
import 'package:app/views/funds/funds_controller.dart';
import 'package:app/views/funds/widgets/funds_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FundsMenuGroup extends GetView<FundsController> {
  const FundsMenuGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 128,
      // color: Colors.amber,
      child: GridView(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4, childAspectRatio: 1 / 2),
        children: [
          FundsMenu(IconFont.zidongqukuanji, "funds.account".tr, to: Routes.fundsManager),
          FundsMenu(IconFont.yuyuejilu, "funds.gameHistory".tr, to: Routes.history1),
          FundsMenu(IconFont.genzongjilu, "funds.history".tr, to: Routes.history2),
          FundsMenu(IconFont.kefu, "app.service".tr, to: Routes.customerService),
        ],
      ),
    );
  }
}
