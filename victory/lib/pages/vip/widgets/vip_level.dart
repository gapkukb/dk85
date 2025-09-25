import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:victory/extensions/currency.extension.dart';
import 'package:victory/extensions/string.extension.dart';
import 'package:victory/iconfont/iconfont.dart';
import 'package:victory/models/vip.model.dart';
import 'package:victory/services/services.dart';
import 'package:victory/theme/theme.dart';
import 'package:victory/pages/vip/index.dart';
import 'package:victory/pages/vip/widgets/vip_bouns.dart';

class VicVipLevelWidget extends GetView<VicVipController> {
  final VicVipLevelModel grade;
  const VicVipLevelWidget(this.grade, {super.key});

  bool get enable => grade.name == services.user.info.value.gradeId.toString();
  VicVipBounsModel? get current => controller.upgradeBouns.firstWhereOrNull((item) {
    return item.gradeId == grade.id;
  });
  bool get hasBouns => current?.isAvailable ?? false;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.all(8),
        height: 344,
        child: GridView(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            mainAxisExtent: 168,
          ),
          children: [
            VipBounsWidget(
              amount: grade.moneyLimit.amount(decimal: 2),
              icon: IconFont.money,
              name: 'vip.advance'.tr,
              enable: hasBouns,
              onPressed: () {
                controller.claimVipUpgradeBonus(grade.id);
              },
            ),
            VipBounsWidget(
              amount: grade.moneyWeek.amount(decimal: 2),
              icon: IconFont.coin2,
              name: 'vip.weekly'.tr,
              enable: enable && controller.hasWeeklyBouns.value,
              onPressed: controller.cliamWeeklyBouns,
            ),
            VipBounsWidget(
              amount: grade.moneyMonth.amount(decimal: 2),
              icon: IconFont.coin,
              name: 'vip.monthly'.tr,
              enable: enable && controller.hasMonthlyBouns.value,
              onPressed: controller.claimMonthlyBonus,
            ),
            // 年度礼金固定展示0
            VipBounsWidget(amount: '0.00', icon: IconFont.coin3, name: 'vip.annual'.tr, showButton: false),
          ],
        ),
      );
    });
  }
}
