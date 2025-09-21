import 'package:flutter/widgets.dart';

class MutipleText extends StatelessWidget {
  final TextStyle? style;
  final TextStyle? subStyle;
  final String? text;
  final String? subText;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? subColor;
  final double? subFontSize;
  final FontWeight? subFontWeight;
  final double? spaing;

  const MutipleText({
    super.key,
    this.style,
    this.subStyle,
    this.text,
    this.subText,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.subColor,
    this.subFontSize,
    this.subFontWeight,
    this.spaing,
  });

  @override
  Widget build(BuildContext context) {
    final $style = TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
    ).merge(style);

    final $subStyle = TextStyle(
      color: subColor,
      fontSize: subFontSize,
      fontWeight: subFontWeight,
    ).merge(subStyle);

    return RichText(
      text: TextSpan(
        style: $style,
        text: text,
        children: [
          if (spaing != null) WidgetSpan(child: SizedBox(width: spaing)),
          TextSpan(style: $subStyle, text: subText),
        ],
      ),
    );
  }
}
