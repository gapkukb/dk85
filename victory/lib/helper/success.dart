import 'dart:async';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../shared/lottie/lottie.dart';

Future<void> showSuccess({
  String text = 'successed',
  Widget? widget,
  VoidCallback? onClose,
}) {
  final c = Completer<void>();
  BotToast.showCustomLoading(
    toastBuilder: (cancelFunc) {
      final List<Widget> children = [
        Lottie.asset(
          'assets/lottie/success.lottie',
          repeat: false,
          width: 96,
          height: 96,
          fit: BoxFit.cover,
          decoder: dotLottieDecoder(
            '0156028b-256d-4785-b700-db3838aa6380.json',
          ),
          onLoaded: (composition) async {
            await Future.delayed(composition.duration);
            cancelFunc();
          },
        ),
      ];

      if (widget != null) {
        children.add(widget);
      } else {
        children.add(
          Text(
            text,
            style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        );
      }

      return Container(
        decoration: const BoxDecoration(
          color: Colors.black54,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
        child: Column(mainAxisSize: MainAxisSize.min, children: children),
      );
    },
    onClose: () {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        c.complete();
        onClose?.call();
      });
    },
  );
  return c.future;
}
