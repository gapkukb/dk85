import 'package:app/shared/amount/amount.dart';
import 'package:app/theme/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../index.dart';

class VipBounsWidget extends GetView<VipController> {
  final IconData icon;
  final String name;
  final num amount;
  final bool enable;
  final VoidCallback? onPressed;
  final bool showButton;

  const VipBounsWidget({super.key, required this.amount, required this.icon, required this.name, this.enable = false, this.showButton = true, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppColors.background, borderRadius: BorderRadius.circular(8)),
      height: 168,
      padding: EdgeInsets.only(top: 8),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        spacing: 8,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(color: AppColors.white, shape: BoxShape.circle),
            child: Icon(icon, color: AppColors.primary, size: 28),
          ),
          Text(name, style: TextStyle(fontSize: 14)),
          Amount(
            amount: '$amount',
            spacing: 4,
            style: TextStyle(fontSize: 16, color: AppColors.title, fontWeight: FontWeight.bold),
            suffixstyle: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
          ),
          if (showButton)
            MaterialButton(
              elevation: 0,
              minWidth: 100,
              height: 32,
              shape: StadiumBorder(),
              highlightElevation: 0,
              color: AppColors.ff8240,
              disabledColor: AppColors.ff8240.withAlpha(128),
              onPressed: enable ? onPressed : null,
              textColor: Colors.white,
              child: Text('ရယူပါ', style: TextStyle(fontSize: 12)),
            ),
        ],
      ),
    );
  }
}
