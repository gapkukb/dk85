import 'package:app/models/game_record.model.dart';
import 'package:app/widgets/multiple_text/multiple_text.dart';
import 'package:flutter/material.dart';
import 'package:app/theme/index.dart';

class HistoryGamesTile extends StatelessWidget {
  final GameRecord record;
  const HistoryGamesTile(this.record, {super.key});

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(fontSize: 12, color: AppColors.description);

    return Container(
      height: 112,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        spacing: 6,
        children: [
          Text(record.name, style: TextStyle(fontWeight: FontWeight.bold)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MutipleText(text: 'Bet Amount:', fontSize: 14, color: AppColors.title, subText: '-${record.validAmount}', subFontWeight: FontWeight.bold, subColor: AppColors.danger),
              MutipleText(
                text: 'Reward Amount:',
                fontSize: 14,
                color: AppColors.title,
                subText: '+${record.winAmount}',
                subFontWeight: FontWeight.bold,
                subColor: record.win.startsWith('-') ? AppColors.warn : AppColors.success,
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Order No.:\n${record.inningNo}', style: style),
              Text(record.betTime, style: style),
            ],
          ),
        ],
      ),
    );
  }
}
