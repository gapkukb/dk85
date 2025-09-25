import 'package:flutter/material.dart';

final vicFadeScaleAnimationBuilder = (context, animation, secondaryAnimation, child) {
  final curved = CurvedAnimation(parent: animation, curve: Curves.easeOutBack);
  return FadeTransition(
    opacity: curved,
    child: ScaleTransition(
      scale: curved,
      child: child,
    ),
  );
};
