import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../iconfont/index.dart';

Future<void> doCopy(String textToCopy) async {
  await Clipboard.setData(ClipboardData(text: textToCopy));
}

class AKClipboard extends StatelessWidget {
  final Widget? child;
  final String? text;
  final Color? color;
  final double size;

  const AKClipboard({super.key, this.child, this.text, this.color, this.size = 18});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 0,
      padding: const EdgeInsets.symmetric(horizontal: 4),
      onPressed: text == null
          ? null
          : () {
              doCopy(text!);
            },
      child: child ?? Icon(IconFont.copy, color: color, size: size),
    );
  }
}
