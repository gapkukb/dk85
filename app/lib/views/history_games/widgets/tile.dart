import 'package:app/widgets/multiple_text/multiple_text.dart';
import 'package:flutter/material.dart';
import 'package:app/theme/index.dart';

class HistoryGamesTile extends StatelessWidget {
  const HistoryGamesTile({super.key});

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(fontSize: 12, color: AppColors.description);

    return Container(
      height: 112,
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
          Text('游戏名称', style: TextStyle(fontWeight: FontWeight.bold)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MutipleText(
                text: '投注金额:',
                fontSize: 14,
                color: AppColors.title,
                subText: '+500',
                subFontWeight: FontWeight.bold,
                subColor: AppColors.danger,
              ),
              MutipleText(
                text: '奖金:',
                fontSize: 14,
                color: AppColors.title,
                subText: '+500',
                subFontWeight: FontWeight.bold,
                subColor: '+500'.startsWith('-')
                    ? AppColors.danger
                    : AppColors.success,
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
    );
  }
}
