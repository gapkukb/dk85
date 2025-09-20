import 'package:bot_toast/bot_toast.dart';

void Function() toast(String text) {
  return BotToast.showText(text: text);
}
