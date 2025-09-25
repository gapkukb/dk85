import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:victory/helper/toast.dart';

final botToastBuilder = BotToastInit();
Widget setupBotToast(BuildContext context, Widget? child) {
  ///例如：全局修改标准通知的动画时间为 1 秒。
  BotToast.defaultOption.text
    ..contentColor = Colors.black.withAlpha(180)
    ..borderRadius = BorderRadius.circular(4)
    ..textStyle = const TextStyle(fontSize: 14, color: Colors.white);

  ///更多默认选项参考下述配置
  ///[BotToast.defaultOption.simpleNotification] 对应 [showSimpleNotification] 的默认值
  ///[BotToast.defaultOption.notification] 对应 [showNotification] 的默认值
  ///[BotToast.defaultOption.customNotification] 对应 [showCustomNotification] 的默认值
  ///[BotToast.defaultOption.text] 对应 [showText] 的默认值
  ///[BotToast.defaultOption.customText] 对应 [showCustomText] 的默认值
  ///[BotToast.defaultOption.loading] 对应 [showLoading] 的默认值
  ///[BotToast.defaultOption.customLoading] 对应 [showCustomLoading] 的默认值
  ///[BotToast.defaultOption.attached] 对应 [showAttachedWidget] 的默认值
  ///[BotToast.defaultOption.animation] 对应 [showAnimationWidget] 的默认值
  ///[BotToast.defaultOption.enhanced] 对应 [showEnhancedWidget] 的默认值

  return botToastBuilder(context, child);
}
