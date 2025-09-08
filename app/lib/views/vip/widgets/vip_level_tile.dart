import 'package:app/iconfont/index.dart';
import 'package:app/models/vip.model.dart';
import 'package:app/shared/amount/amount.dart';
import 'package:app/theme/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../index.dart';

class VipLevelTileWidget extends GetView<VipController> {
  final VipModel vip;
  const VipLevelTileWidget(this.vip, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      // height: 200,
      child: Column(
        children: [
          Container(
            height: 36,
            padding: EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
            ),
            child: Row(
              children: [
                Text(
                  'vip.level.rights'.trParams({'level': vip.name}),
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.primary),
                ),
                Spacer(),
                Text('vip.valid.bet'.tr, style: TextStyle(fontSize: 12)),
                Text(
                  '${vip.betLimit}',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.highlight),
                ),
              ],
            ),
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.e1e1e1,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(8)),
            ),
            child: GridView(
              padding: EdgeInsets.all(8),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 4, crossAxisSpacing: 4, mainAxisExtent: 56),
              children: [
                buildItem(IconFont.money, 'vip.advance'.tr, vip.moneyLimit),
                buildItem(IconFont.coin, 'vip.weekly'.tr, vip.moneyWeek),
                buildItem(IconFont.coin2, 'vip.monthly'.tr, vip.moneyMonth),
                buildItem(IconFont.coin3, 'vip.annual'.tr, 0),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildItem(IconData icon, String name, num amount) {
    return ListTile(
      minTileHeight: 0,
      contentPadding: EdgeInsets.all(0),
      // minVerticalPadding: 0,
      leading: CircleAvatar(
        backgroundColor: AppColors.background,
        radius: 18,
        child: Icon(icon, color: AppColors.primary.withAlpha(128)),
      ),
      horizontalTitleGap: 8,
      title: Padding(
        padding: const EdgeInsets.only(bottom: 4.0),
        child: Text(name, style: TextStyle(fontSize: 12, color: AppColors.label)),
      ),
      subtitle: Amount(
        amount: '$amount',
        spacing: 4,
        style: TextStyle(fontSize: 14, color: AppColors.subtitle, fontWeight: FontWeight.bold),
      ),
    );
  }
}
