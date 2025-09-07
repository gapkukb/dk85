import 'package:app/extensions/lottie.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

final loadingWidget = Lottie.asset(
  'assets/lottie/loading.lottie',
  width: 96,
  height: 96,
  fit: BoxFit.cover,
  decoder: dotLottieDecoder('c1e4ef8f-0b4a-4e63-9a4e-a2e4ba95665a.json'),
  delegates: LottieDelegates(
    values: [
      ValueDelegate.color(const ['**', 'Layer 1 Outlines', '**'], value: Colors.white),
      ValueDelegate.opacity(const ['**', 'Layer 1 Outlines', '**'], value: 80),
    ],
  ),
);

class AKLoading extends StatelessWidget {
  final String? text;
  final TextStyle? style;
  const AKLoading({super.key, this.text, this.style});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      constraints: BoxConstraints(minHeight: 120, minWidth: 120, maxWidth: 240),
      decoration: BoxDecoration(color: Colors.black.withAlpha(180), borderRadius: BorderRadius.all(Radius.circular(12))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          loadingWidget,
          if (text != null)
            Transform.translate(
              offset: Offset(0, -12),
              child: Text(
                text!,
                style: TextStyle(color: Colors.white, fontSize: 14).merge(style),
                textAlign: TextAlign.center,
              ),
            ),
        ],
      ),
    );
  }
}
