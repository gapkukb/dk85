import 'package:app/shared/balance/balance.dart';
import 'package:app/theme/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountBalance extends StatelessWidget {
  final double height;
  final Widget? before;
  final Widget? after;
  const AccountBalance({super.key, this.height = 116, this.after, this.before});

  @override
  Widget build(BuildContext context) {
    return Balance(
      amountStyle: TextStyle(fontSize: 40),
      trailingStyle: TextStyle(fontSize: 20, height: 1.5),
      refresherSize: 24,
      builder: (context, amount, refresher) {
        return Container(
          height: height,
          margin: EdgeInsets.only(left: 8, right: 8),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(4),
            image: const DecorationImage(
              alignment: Alignment(0, 0.2),
              image: AssetImage("assets/images/balance-bg.png"),
              fit: BoxFit.fitWidth,
            ),
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
                  Text(
                    "app.balance".tr,
                    style: TextStyle(fontSize: 16, color: AppColors.white),
                  ),
                  refresher,
                ],
              ),
              amount,
              if (after != null) after!,
            ],
          ),
        );
      },
    );
  }
}
