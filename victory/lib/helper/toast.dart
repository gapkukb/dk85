import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

String _prev = '';

void toast(String text) {
  if (_prev == text) return;
  _prev = text;
  BotToast.showCustomText(
    onClose: () => _prev = '',
    duration: const Duration(seconds: 3),
    toastBuilder: (_) {
      return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Container(
            constraints: constraints.copyWith(maxWidth: constraints.biggest.width * 0.8),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: const BoxDecoration(
              color: Colors.black87,
              borderRadius: BorderRadius.all(Radius.circular(4)),
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
