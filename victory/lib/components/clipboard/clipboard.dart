import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../helper/toast.dart';

class VicClipboard extends StatelessWidget {
  static Future<void> copy(String content) async {
    await Clipboard.setData(ClipboardData(text: content));
    toast('copy successful!');
  }

  final String content;
  const VicClipboard({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => copy(content),
      child: const Icon(Symbols.content_copy),
    );
  }
}
