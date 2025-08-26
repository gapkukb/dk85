import 'package:app/helper/copy.dart';
import 'package:flutter/material.dart';
import '../../iconfont/index.dart';

class AKClipboard extends StatelessWidget {
  final Widget? child;
  final String? text;
  final Color? color;
  final double size;

  const AKClipboard({
    super.key,
    this.child,
    this.text,
    this.color,
    this.size = 18,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 0,
      padding: const EdgeInsets.symmetric(horizontal: 4),
      onPressed: text == null
          ? null
          : () {
              copy(text!);
            },
      child: child ?? Icon(IconFont.copy, color: color, size: size),
    );
  }
}
