import 'package:flutter/material.dart';

class RoundedTabIndicator extends Decoration {
  RoundedTabIndicator({Color color = Colors.white, double radius = 2.0, double height = 4.0, double bottom = 0.0, top = 0.0, left = 0.0, right = 0.0})
    : _painter = _RoundedRectanglePainter(color, height, radius, bottom);

  final BoxPainter _painter;

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _painter;
  }
}

class _RoundedRectanglePainter extends BoxPainter {
  _RoundedRectanglePainter(Color color, this.height, this.radius, this.bottom)
    : _paint = Paint()
        ..color = color
        ..isAntiAlias = true;

  final Paint _paint;
  final double radius;
  final double height;
  final double bottom;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    // final centerX = (cfg.size?.width ?? 0) / 2 + offset.dx;
    // final bottom = (cfg.size?.height) ?? 0 - bottomMargin;
    // final halfWidth = cfg.size?.width ?? 0 / 2;
    final Rect rect = offset & cfg.size!;
    canvas.drawRRect(RRect.fromLTRBR(rect.left - 4, rect.bottom - height, rect.right + 4, rect.bottom - bottom, Radius.circular(radius)), _paint);
  }
}
