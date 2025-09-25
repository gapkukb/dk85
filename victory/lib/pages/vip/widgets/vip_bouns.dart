import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:victory/components/amount/amount.dart';
import 'package:victory/theme/theme.dart';
import 'package:victory/pages/vip/index.dart';

class VipBounsWidget extends GetView<VicVipController> {
  final IconData icon;
  final String name;
  final String amount;
  final bool enable;
  final VoidCallback? onPressed;
  final bool showButton;

  const VipBounsWidget({
    super.key,
    required this.amount,
    required this.icon,
    required this.name,
    this.enable = false,
    this.showButton = true,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppColors.background, borderRadius: BorderRadius.circular(8)),
      height: 168,
      padding: const EdgeInsets.only(top: 8),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        spacing: 8,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: const BoxDecoration(color: AppColors.white, shape: BoxShape.circle),
            child: Icon(icon, color: AppColors.primary, size: 28),
          ),
          Text(name, style: const TextStyle(fontSize: 14)),
          VicAmount(
            amount: amount,
            spacing: 4,
            style: const TextStyle(fontSize: 16, color: AppColors.title, fontWeight: FontWeight.bold),
            suffixstyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
          ),
          if (showButton)
            MaterialButton(
              elevation: 0,
              minWidth: 100,
              height: 32,
              shape: const StadiumBorder(),
              highlightElevation: 0,
              color: AppColors.ff8240,
              disabledColor: AppColors.ff8240.withAlpha(128),
              onPressed: enable ? onPressed : null,
              textColor: Colors.white,
              child: Text('app.claim.now'.tr, style: const TextStyle(fontSize: 12)),
            ),
        ],
      ),
    );
  }
}
