import "package:flutter/material.dart";

abstract class AppColors {
  static const background = Color(0xffeef2f5);
  static const primary = Color(0xffff8240);
  static const highlight = Color(0xffff5800);
  static const white = Color(0xffffffff);
  static const title = Color(0xff111111);
  static const subtitle = Color(0xff333333);
  static const border = Color(0xffE1E2EB);
  static const label = Color(0xff666666);
  static const ff8240 = Color(0xffFF8240);
  static const e1e1e1 = Color(0xffe1e1e1);
  static const dddddd = Color(0xffdddddd);
  static const ffeee5 = Color(0xffffeee5);
  static const description = Color(0xff999999);
  static const skeleton = Color(0xFFE8E6EC);
  static const loading = Color(0xffe5e5e5);
  static const danger = Color(0xffff0000);
  static const success = Colors.green;
  static const warn = Colors.orange;
  static const ff9d00 = Color(0xffFF9D00);
  static const info = Colors.blue;
  static const helper = Color(0xffbbbbbb);
  static const fff0e2 = Color(0xfffff0e2);
  static const fffac4 = Color(0xfffffac4);
  static const FFF3C5 = Color(0xffFFF3C5);
  static const disabled = Color(0xFF8D8D8D);

  static const buttonGradient = RadialGradient(
    colors: [Color.fromRGBO(255, 255, 255, 0.3), Color.fromRGBO(255, 230, 215, 0.0001)],
    center: Alignment(-0.8, -0.6),
    radius: 7,
  );
}
