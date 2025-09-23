import 'package:flutter/material.dart';

/// 将 hex 字符串（支持 #RRGGBB / RRGGBB）转为 [Color]
extension HexColor on String {
  Color toColor() {
    var hex = replaceAll('#', '');
    if (hex.length == 6) {
      hex = 'FF$hex'; // 默认不透明
    }
    return Color(int.parse('0x$hex'));
  }
}
