import 'package:app/models/fund_record.model.dart';
import 'package:app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:app/theme/index.dart';
import 'package:get/get.dart';
import 'package:nil/nil.dart';

const Map<int, Color> _colorMap = {1: AppColors.warn, 2: AppColors.success, 3: AppColors.warn};
const Map<int, String> _titleMap = {1: 'Pending Withdraw', 2: 'Withdraw Successful', 3: 'Withdraw Failed'};

Color stateColor(int state) {
  return _colorMap[state] ?? _colorMap[0]!;
}

class HistoryWithdrawTile extends StatelessWidget {
  final FundRecord record;
  const HistoryWithdrawTile(this.record, {super.key});

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(fontSize: 12, color: AppColors.description);
    final amount = '+${record.money}';

    return GestureDetector(
      onTap: () => Get.toNamed(Routes.historyDetial),
      child: Container(
        height: 86,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
    final text = Text('${_titleMap[record.status]}', style: TextStyle(fontWeight: FontWeight.bold));

    if (record.status != 1) return text;

    return Badge(label: nil, padding: EdgeInsets.all(4), smallSize: 1, largeSize: 1, offset: Offset(4, -4), child: text);
  }
}
