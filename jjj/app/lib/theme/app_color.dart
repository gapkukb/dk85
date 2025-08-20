import 'package:flutter/material.dart';

abstract class AppColors {
  static const background = Color(0xffeef2f5);
  static const primary = Color(0xffff8240);
  static const highlight = Color(0xffff5800);
  static const white = Color(0xffffffff);
  static const title = Color(0xff111111);
  static const label = Color(0xff667984);
  static const ff8240 = Color(0xffFF8240);
  static const ffeee5 = Color(0xffffeee5);
  static const description = Color(0xff999999);
  static const buttonGradient = RadialGradient(
    colors: [
      Color.fromRGBO(255, 255, 255, 0.3),
      Color.fromRGBO(255, 230, 215, 0.0001),
    ],
    center: Alignment(-0.8, -0.6),
    radius: 7,
  );
}

// background: linear-gradient(0deg, #FF8240, #FF8240),
// radial-gradient(710.82% 50% at 13.62% 0%, rgba(255, 255, 255, 0.301) 0%, rgba(255, 230, 215, 0.0001) 100%);
