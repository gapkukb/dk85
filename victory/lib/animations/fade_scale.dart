import 'package:flutter/material.dart';

Widget vicFadeScaleAnimationBuilder(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
  final curved = CurvedAnimation(parent: animation, curve: Curves.easeOutBack);
  return FadeTransition(
    opacity: curved,
    child: ScaleTransition(
      scale: curved,
      child: child,
    ),
  );
}
