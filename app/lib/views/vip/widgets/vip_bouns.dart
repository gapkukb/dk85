import 'package:app/iconfont/index.dart';
import 'package:app/shared/amount/amount.dart';
import 'package:app/theme/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../index.dart';

class VipBounsWidget extends GetView<VipController> {
  const VipBounsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(8),
      ),
      height: 168,
      padding: EdgeInsets.only(top: 8),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        spacing: 8,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.white,
              shape: BoxShape.circle,
            ),
            child: Icon(IconFont.money, color: AppColors.primary, size: 28),
          ),
          Text('အပတ်စဉ်လက်ဆောင်', style: TextStyle(fontSize: 12)),
          Amount(
            amount: '2000',
            spacing: 4,
            style: TextStyle(
              fontSize: 16,
              color: AppColors.title,
              fontWeight: FontWeight.bold,
            ),
            suffixstyle: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
          ),
          MaterialButton(
            elevation: 0,
            minWidth: 100,
            height: 32,
            shape: StadiumBorder(),
            highlightElevation: 0,
            color: AppColors.ff8240,
            onPressed: () {},
            textColor: Colors.white,
            child: Text('ရယူပါ', style: TextStyle(fontSize: 12)),
          ),
        ],
      ),
    );
  }
}
