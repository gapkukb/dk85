import 'package:app/iconfont/index.dart';
import 'package:app/shared/amount/amount.dart';
import 'package:app/theme/index.dart';
import 'package:app/views/vip/widgets/vip_bouns.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../index.dart';

class VipLevelTileWidget extends GetView<VipController> {
  const VipLevelTileWidget({super.key});

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
                  ' VIP1 အကျိုးအခွင့်',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
                Spacer(),
                Text('သက်တမ်းရှိသောပုံစံ：', style: TextStyle(fontSize: 12)),
                Text(
                  '0.00',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColors.highlight,
                  ),
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
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
                mainAxisExtent: 56,
              ),
              children: [
                buildItem(IconFont.money),
                buildItem(IconFont.coin),
                buildItem(IconFont.coin2),
                buildItem(IconFont.coin3),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildItem(IconData icon) {
    return ListTile(
      minTileHeight: 0,
      contentPadding: EdgeInsets.all(0),
      minVerticalPadding: 0,
      leading: CircleAvatar(
        backgroundColor: AppColors.background,
        radius: 18,
        child: Icon(icon, color: AppColors.primary.withAlpha(128)),
      ),
      horizontalTitleGap: 8,
      title: Text(
        'ပရိုမိုးရှင်း အပိုဆု',
        style: TextStyle(fontSize: 12, color: AppColors.label),
      ),
      subtitle: Amount(
        amount: '3000',
        spacing: 4,
        style: TextStyle(
          fontSize: 14,
          color: AppColors.subtitle,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
