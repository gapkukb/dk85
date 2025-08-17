import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

dynamic setupBotToast() {
  BotToast.defaultOption.text
    ..contentColor = Colors.black.withAlpha(180)
    ..borderRadius = BorderRadius.circular(4)
    // ..wrapToastAnimation = (controller, cancelFunc, widget) {
    //   return ScaleTransition(
    //     scale: Tween<double>(begin: 0.5, end: 1.0).animate(
    //       CurvedAnimation(
    //         parent: controller, // Your AnimationController
    //         curve: Curves.fastOutSlowIn,
    //       ),
    //     ),
    //     child: FadeTransition(
    //       opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
    //         CurvedAnimation(
    //           parent: controller, // Your AnimationController
    //           curve: Curves.fastOutSlowIn,
    //         ),
    //       ),
    //       child: widget,
    //     ),
    //   );
    // }
    ..textStyle = const TextStyle(fontSize: 14, color: Colors.white);

  return BotToastInit();
}
