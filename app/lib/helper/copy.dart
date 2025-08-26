import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/services.dart';

Future<void> copy(String content) async {
  await Clipboard.setData(ClipboardData(text: content));
  BotToast.showText(text: 'copy successful!');
}

VoidCallback copier(String content) {
  return () {
    copy(content);
  };
}
