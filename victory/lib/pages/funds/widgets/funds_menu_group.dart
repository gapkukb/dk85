import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../iconfont/iconfont.dart';
import '../../../routes/app_pages.dart';
import '../index.dart';
import 'funds_menu.dart';

class VicFundMenuGroup extends GetView<FundsController> {
  const VicFundMenuGroup({super.key});

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
          VicFundMenu(IconFont.zidongqukuanji, "funds.account".tr, to: AppRoutes.fundAccount),
          VicFundMenu(IconFont.yuyuejilu, "funds.gameHistory".tr, to: AppRoutes.history1),
          VicFundMenu(IconFont.genzongjilu, "funds.history".tr, to: AppRoutes.history2),
          VicFundMenu(IconFont.kefu, "app.service".tr, to: AppRoutes.customerService),
        ],
      ),
    );
  }
}
