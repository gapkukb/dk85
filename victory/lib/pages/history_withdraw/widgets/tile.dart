import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/fund_record.model.dart';
import '../../../routes/app_pages.dart';
import '../../../theme/theme.dart';

const Map<int, Color> _colorMap = {1: AppColors.warn, 2: AppColors.success, 3: AppColors.warn};
const Map<int, String> _titleMap = {1: 'Pending Withdraw', 2: 'Withdraw Successful', 3: 'Withdraw Failed'};

Color stateColor(int state) {
  return _colorMap[state] ?? _colorMap[0]!;
}

class HistoryWithdrawTile extends StatelessWidget {
  final VicFundHisotryModel record;
  const HistoryWithdrawTile(this.record, {super.key});

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(fontSize: 12, color: AppColors.description);
    final amount = '${record.status == 3 ? '+' : '-'}${record.money}';

    return GestureDetector(
      onTap: () => Get.toNamed(AppRoutes.historyWithdrawalDetials, arguments: record),
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
