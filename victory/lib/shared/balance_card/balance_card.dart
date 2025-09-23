import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../stores/stores.dart';
import '../../theme/theme.dart';
import '../balance/balance.dart';

class VicBalanceCard extends StatelessWidget {
  final double height;
  final Widget? before;
  final Widget? after;
  const VicBalanceCard({super.key, this.height = 116, this.after, this.before});

  @override
  Widget build(BuildContext context) {
    return VicBalanceBuilder(
      amountStyle: const TextStyle(fontSize: 40, height: 1),
      // trailingStyle: TextStyle(fontSize: 20, height: 1.5),
      refresherSize: 24,
      builder: (context, amount, button, _) {
        final text = "app.balance".tr;
        return Container(
          height: height,
          margin: const EdgeInsets.only(left: 12, right: 12),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          decoration: BoxDecoration(
            gradient: const RadialGradient(colors: [Color(0xffFF8544), Color(0xffFF5800)], center: Alignment(-0.5, -1), radius: 1.3),
            borderRadius: BorderRadius.circular(12),
            image: const DecorationImage(alignment: Alignment(0, 0.2), image: AssetImage("assets/images/balance-bg.png"), fit: BoxFit.fitWidth),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (before != null) before!,
              Row(
                spacing: 8,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(text, style: const TextStyle(fontSize: 16, color: AppColors.white)),
                  button,
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                spacing: 8,
                children: [
                  amount,
                  const Text(
                    'MMK',
                    // strutStyle: StrutStyle(height: 1),
                    style: TextStyle(fontSize: 24, height: 1.3, color: AppColors.white),
                  ),
                ],
              ),
              if (after != null) after!,
            ],
          ),
        );
      },
    );
  }
}
