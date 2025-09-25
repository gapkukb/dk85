import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

void Function() toast(String text) {
  return BotToast.showCustomText(
    duration: const Duration(seconds: 2),
    toastBuilder: (_) {
      return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Container(
            constraints: constraints.copyWith(maxWidth: constraints.biggest.width * 0.8),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.black87,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              text,
              style: const TextStyle(fontSize: 12, color: Colors.white),
              textAlign: TextAlign.center,
            ),
          );
        },
      );
    },
  );
}
