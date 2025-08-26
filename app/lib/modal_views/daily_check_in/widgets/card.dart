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
  // 已过期
  '1': _CardStyle(
    'assets/icons/coin-2.webp',
    Color(0xffffdecc),
    Color(0xffCC8864),
  ),
  // 不可签到
  '2': _CardStyle(
    'assets/icons/coin-3.webp',
    Color(0xffffefe6),
    AppColors.primary,
  ),
  // 已签到
  '3': _CardStyle(
    'assets/icons/coin-1.webp',
    Color(0xffffbc99),
    Color(0xffff772e),
  ),
};

class DailyCheckInCard extends StatelessWidget {
  final int index;
  const DailyCheckInCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final style = _styleMap[index.toString()] ?? _styleMap['2']!;

    return Container(
      decoration: BoxDecoration(
        color: style.bgColor,
        borderRadius: BorderRadius.circular(4),
        image: DecorationImage(
          image: AssetImage(style.iconPath),
          alignment: Alignment(0, -0.7),
          scale: 2,
        ),
      ),
      padding: EdgeInsets.only(top: 38),
      child: Text(
        '${index + 1}',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: style.textColor,
          fontSize: 9.5,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
