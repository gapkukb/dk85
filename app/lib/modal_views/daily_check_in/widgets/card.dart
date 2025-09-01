import 'package:app/models/daily_check_in.model.dart';
import 'package:app/shared/formatter/formatter.dart';
import 'package:app/theme/index.dart';
import 'package:flutter/material.dart';

class _CardStyle {
  final String iconPath;
  final Color bgColor;
  final Color textColor;

  _CardStyle(this.iconPath, this.bgColor, this.textColor);
}

final _styleMap = {
  // 可签到
  '0': _CardStyle('assets/icons/coin-1.webp', Color(0xffff8240), Colors.white),
  // 已签到
  '1': _CardStyle('assets/icons/coin-1.webp', Color(0xffffbc99), Color(0xffff772e)),
  // 已过期
  '2': _CardStyle('assets/icons/coin-2.webp', Color(0xffffdecc), Color(0xffCC8864)),
  // 不可签到
  '3': _CardStyle('assets/icons/coin-3.webp', Color(0xffffefe6), AppColors.primary),
};

class DailyCheckInCard extends StatelessWidget {
  final DailyCheckInModel model;
  const DailyCheckInCard(this.model, {super.key});

  @override
  Widget build(BuildContext context) {
    final style = _styleMap[model.status.toString()] ?? _styleMap['2']!;

    return Container(
      decoration: BoxDecoration(
        color: style.bgColor,
        borderRadius: BorderRadius.circular(4),
        image: DecorationImage(image: AssetImage(style.iconPath), alignment: Alignment(0, -0.7), scale: 2),
      ),
      padding: EdgeInsets.only(top: 38),
      child: Text(
        Formatter.dateTime.dmmm(model.date),
        textAlign: TextAlign.center,
        style: TextStyle(color: style.textColor, fontSize: 9.5, fontWeight: FontWeight.bold),
      ),
    );
  }
}
