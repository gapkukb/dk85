import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:victory/components/amount/amount.dart';
import 'package:victory/extensions/currency.extension.dart';
import 'package:victory/extensions/string.extension.dart';
import 'package:victory/iconfont/iconfont.dart';
import 'package:victory/models/vip.model.dart';
import 'package:victory/theme/theme.dart';
import 'package:victory/pages/vip/index.dart';

class VicVipLevelTileWidget extends GetView<VicVipController> {
  final VicVipLevelModel vip;
  const VicVipLevelTileWidget(this.vip, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      // height: 200,
      child: Column(
        children: [
          Container(
            height: 36,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: const BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
            ),
            child: Row(
              children: [
                Text(
                  'vip.level.rights'.trParams({'level': vip.name}),
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.primary),
                ),
                const Spacer(),
                Text('vip.valid.bet'.tr, style: const TextStyle(fontSize: 12)),
                Text(
                  vip.betLimit.amount(),
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.highlight),
                ),
              ],
            ),
          ),
          DecoratedBox(
            decoration: const BoxDecoration(
              color: AppColors.e1e1e1,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(8)),
            ),
            child: GridView(
              padding: const EdgeInsets.all(8),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
                mainAxisExtent: 56,
              ),
              children: [
                buildItem(IconFont.money, 'vip.advance'.tr, vip.moneyLimit.amount(decimal: 2)),
                buildItem(IconFont.coin, 'vip.weekly'.tr, vip.moneyWeek.amount(decimal: 2)),
                buildItem(IconFont.coin2, 'vip.monthly'.tr, vip.moneyMonth.amount(decimal: 2)),
                buildItem(IconFont.coin3, 'vip.annual'.tr, '0'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildItem(IconData icon, String name, String amount) {
    return ListTile(
      minTileHeight: 0,
      contentPadding: const EdgeInsets.all(0),
      // minVerticalPadding: 0,
      leading: CircleAvatar(
        backgroundColor: AppColors.background,
        radius: 18,
        child: Icon(icon, color: AppColors.primary.withAlpha(128)),
      ),
      horizontalTitleGap: 8,
      title: Padding(
        padding: const EdgeInsets.only(bottom: 4.0),
        child: Text(name, style: const TextStyle(fontSize: 12, color: AppColors.label)),
      ),
      subtitle: VicAmount(
        amount: amount,
        spacing: 4,
        style: const TextStyle(fontSize: 14, color: AppColors.subtitle, fontWeight: FontWeight.bold),
      ),
    );
  }
}
