import 'package:app/iconfont/index.dart';
import 'package:app/models/vip.model.dart';
import 'package:app/services/index.dart';
import 'package:app/theme/index.dart';
import 'package:app/views/vip/widgets/vip_bouns.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../index.dart';

class VipLevelWidget extends GetView<VipController> {
  final VipModel grade;
  const VipLevelWidget(this.grade, {super.key});

  bool get enable => grade.name == services.user.userInfo.value?.gradeId.toString();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(8)),
      padding: EdgeInsets.all(8),
      height: 344,
      child: GridView(
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 8, crossAxisSpacing: 8, mainAxisExtent: 168),
        children: [
          VipBounsWidget(amount: grade.moneyLimit, icon: IconFont.money, name: 'vip.advance'.tr),
          Obx(
            () => VipBounsWidget(
              amount: grade.moneyWeek,
              icon: IconFont.coin2,
              name: 'vip.weekly'.tr,
              enable: enable && controller.hasWeeklyBouns.value,
              onPressed: () {
                print('123');
              },
            ),
          ),
          VipBounsWidget(
            amount: grade.moneyMonth,
            icon: IconFont.coin,
            name: 'vip.monthly'.tr,
            enable: enable && controller.hasMonthlyBouns.value,
            onPressed: () {
              print('123');
            },
          ),
          // 年度礼金固定展示0
          VipBounsWidget(amount: 0, icon: IconFont.coin3, name: 'vip.annual'.tr, showButton: false),
        ],
      ),
    );
  }
}
