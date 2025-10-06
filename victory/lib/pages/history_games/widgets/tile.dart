import 'package:flutter/material.dart';

import 'package:victory/components/multiple_text/multiple_text.dart';
import 'package:victory/extensions/currency.extension.dart';
import 'package:victory/models/game_record.model.dart';
import 'package:victory/theme/theme.dart';

class HistoryGamesTile extends StatelessWidget {
  final VicGameHistoryModel record;
  const HistoryGamesTile(this.record, {super.key});

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(fontSize: 12, color: AppColors.description);

    return Container(
      height: 112,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        spacing: 6,
        children: [
          Text(record.name, style: const TextStyle(fontWeight: FontWeight.bold)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              VicInlineText(
                text: 'Bet Amount: ',
                fontSize: 14,
                color: AppColors.title,
                subText: '-${record.validAmount.amount()}',
                subFontWeight: FontWeight.bold,
                subColor: AppColors.danger,
              ),
              VicInlineText(
                text: 'Reward Amount: ',
                fontSize: 14,
                color: AppColors.title,
                subText: '+${record.winAmount.amount()}',
                subFontWeight: FontWeight.bold,
                subColor: record.winAmount > 0 ? AppColors.success : AppColors.warn,
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
