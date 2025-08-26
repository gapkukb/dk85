import 'package:app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:app/theme/index.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:nil/nil.dart';

const Map<int, Color> colorMap = {
  0: AppColors.danger,
  1: AppColors.success,
  2: AppColors.warn,
  3: AppColors.info,
};

Color stateColor(int state) {
  return colorMap[state] ?? colorMap[0]!;
}

class HistoryTopUpTile extends StatelessWidget {
  const HistoryTopUpTile({super.key});

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(fontSize: 12, color: AppColors.description);
    const amount = '+500';

    return GestureDetector(
      onTap: () => Get.toNamed(Routes.historyDetial),
      child: Container(
        height: 86,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          spacing: 6,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildTitle(true),
                Text(
                  amount,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: stateColor(3),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('订单号:\n14564112315465456464s4fd65asd4f', style: style),
                Text('2025-08-01 00:00:00', style: style),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTitle(bool showBadge) {
    final text = Text(
      'Pending Payment',
      style: TextStyle(fontWeight: FontWeight.bold),
    );

    if (!showBadge) return text;

    return Badge(
      label: nil,
      padding: EdgeInsets.all(4),
      smallSize: 1,
      largeSize: 1,
      offset: Offset(4, -4),
      child: text,
    );
  }
}
