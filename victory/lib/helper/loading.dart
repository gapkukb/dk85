import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

import '../shared/lottie/lottie.dart';

class VicLoading extends StatelessWidget {
  final String? text;
  final TextStyle? style;
  const VicLoading({super.key, this.text, this.style});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      constraints: const BoxConstraints(minHeight: 100, minWidth: 100, maxWidth: 240),
      decoration: BoxDecoration(color: Colors.black.withAlpha(180), borderRadius: const BorderRadius.all(Radius.circular(8))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          vicLoadingIcon,
          if (text != null)
            Transform.translate(
              offset: const Offset(0, -12),
              child: Text(
                text!,
                style: const TextStyle(color: Colors.white, fontSize: 12).merge(style),
                textAlign: TextAlign.center,
              ),
            ),
        ],
      ),
    );
  }
}

const _loading = VicLoading();

void Function() showLoading([String? text]) {
  return BotToast.showCustomLoading(
    toastBuilder: (cancelFunc) {
      if (text == null) return _loading;

      return VicLoading(
        text: text,
      );
    },
  );
}
