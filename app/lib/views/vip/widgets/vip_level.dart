import 'package:app/iconfont/index.dart';
import 'package:app/models/vip.model.dart';
import 'package:app/views/vip/widgets/vip_bouns.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../index.dart';

class VipLevelWidget extends GetView<VipController> {
  final VipModel grade;
  const VipLevelWidget(this.grade, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 344,
      child: GridView(
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 8, crossAxisSpacing: 8, mainAxisExtent: 168),
        children: [
          VipBounsWidget(amount: grade.moneyLimit, icon: IconFont.money, name: 'vip.advance'.tr),
          VipBounsWidget(amount: grade.moneyWeek, icon: IconFont.coin2, name: 'vip.weekly'.tr),
          VipBounsWidget(amount: grade.moneyMonth, icon: IconFont.coin, name: 'vip.monthly'.tr),
          // 年度礼金固定展示0
          VipBounsWidget(amount: 0, icon: IconFont.coin3, name: 'vip.annual'.tr, showButton: false),
        ],
      ),
    );
  }
}
