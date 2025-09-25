import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:victory/models/fund_record.model.dart';
import 'package:victory/routes/app_pages.dart';
import 'package:victory/theme/theme.dart';

const Map<int, Color> _colorMap = {1: AppColors.warn, 2: AppColors.success, 3: AppColors.warn};
const Map<int, String> _titleMap = {1: 'Pending Payment', 2: 'Payment Successful', 3: 'Payment Failed'};

Color stateColor(int state) {
  return _colorMap[state] ?? _colorMap[0]!;
}

class HistoryTopUpTile extends StatelessWidget {
  final VicFundHisotryModel record;
  const HistoryTopUpTile(this.record, {super.key});

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(fontSize: 12, color: AppColors.description);
    final amount = '+${record.money}';

    return GestureDetector(
      onTap: () => Get.toNamed(AppRoutes.historyDepositDetails, arguments: record),
      child: Container(
        height: 86,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(8)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          spacing: 6,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildTitle(),
                Text(
                  amount,
                  style: TextStyle(fontWeight: FontWeight.bold, color: stateColor(record.status)),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Order Number:\n${record.tradeNo}', style: style),
                Text(record.time, style: style),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTitle() {
    final text = Text('${_titleMap[record.status]}', style: const TextStyle(fontWeight: FontWeight.bold));

    if (record.status != 1) return text;

    return Badge(
      label: const SizedBox.shrink(),
      padding: const EdgeInsets.all(4),
      smallSize: 1,
      largeSize: 1,
      offset: const Offset(4, -4),
      child: text,
    );
  }
}
