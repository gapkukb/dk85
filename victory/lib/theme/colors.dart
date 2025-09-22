import "package:flutter/material.dart";

abstract class AppColors {
  static const background = const Color(0xffeef2f5);
  static const primary = const Color(0xffff8240);
  static const highlight = const Color(0xffff5800);
  static const white = const Color(0xffffffff);
  static const title = const Color(0xff111111);
  static const subtitle = const Color(0xff333333);
  static const border = const Color(0xffE1E2EB);
  static const label = const Color(0xff666666);
  static const ff8240 = const Color(0xffFF8240);
  static const e1e1e1 = const Color(0xffe1e1e1);
  static const dddddd = const Color(0xffdddddd);
  static const ffeee5 = const Color(0xffffeee5);
  static const description = const Color(0xff999999);
  static const skeleton = const Color(0xFFE8E6EC);
  static const loading = const Color(0xffe5e5e5);
  static const danger = const Color(0xffff0000);
  static const success = Colors.green;
  static const warn = Colors.orange;
  static const ff9d00 = const Color(0xffFF9D00);
  static const info = Colors.blue;
  static const helper = const Color(0xffbbbbbb);
  static const fff0e2 = const Color(0xfffff0e2);
  static const fffac4 = const Color(0xfffffac4);
  static const FFF3C5 = const Color(0xffFFF3C5);

  static const buttonGradient = const RadialGradient(
    colors: [Color.fromRGBO(255, 255, 255, 0.3), Color.fromRGBO(255, 230, 215, 0.0001)],
    center: Alignment(-0.8, -0.6),
    radius: 7,
  );
}
