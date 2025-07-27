import 'package:flutter/cupertino.dart';

class Monetary extends StatelessWidget {
  final double fontSize;
  final bool bold;
  final Color? color;
  const Monetary({super.key, this.bold = true, this.fontSize = 24, this.color});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: "0.00",
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: bold ? FontWeight.bold : FontWeight.normal,
        ),
        children: [
          WidgetSpan(child: SizedBox(width: fontSize / 4)),
          TextSpan(
            text: "MMK",
            style: TextStyle(fontSize: fontSize / 2),
          ),
        ],
      ),
    );
  }
}
