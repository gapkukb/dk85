import 'package:flutter/material.dart';

class VicAmount extends StatelessWidget {
  final TextStyle? style;
  final TextStyle? amountstyle;
  final TextStyle? suffixstyle;
  final String? amount;
  final String? before;
  final String? after;
  final double spacing;
  const VicAmount({
    super.key,
    this.spacing = 0.0,
    this.before,
    this.after,
    this.style,
    this.amount,
    this.amountstyle,
    this.suffixstyle,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: style,
        children: [
          if (before != null) TextSpan(text: before),
          TextSpan(text: amount, style: amountstyle),
          if (spacing > 0)
            WidgetSpan(
              child: SizedBox(
                width: spacing,
              ), // Adjust width for desired indent
            ),
          TextSpan(text: 'MMK', style: suffixstyle),
          if (after != null) TextSpan(text: after),
        ],
      ),
    );
  }
}
