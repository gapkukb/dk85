import "package:flutter/material.dart";

abstract class AppColor {
  static const primary = const Color(0xffff8240);
  static const danger = const Color(0xffff5800);
  static const success = const Color(0xffff5800);
  static const warn = const Color(0xfffffac4);
  static const info = const Color(0xffff5800);
  static const title = const Color(0xff111111);
  static const subtitle = const Color(0xff333333);
  static const label = const Color(0xff666666);
  static const description = const Color(0xff999999);
  static const border = const Color(0xffdddddd);
  static const helper = const Color(0xffbbbbbb);
  static const background = const Color(0xfff5f5f5);
  static const white = Colors.white;
  static const highlight = const Color(0xffff5800);
  static const fff0e2 = const Color(0xfffff0e2);
  static const buttonGradient = const RadialGradient(
    colors: [Color.fromRGBO(255, 255, 255, 0.3), Color.fromRGBO(255, 230, 215, 0.0001)],
    center: Alignment(-0.8, -0.6),
    radius: 7,
  );
}
