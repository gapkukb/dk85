import 'package:flutter/material.dart';

class UnderlineArrowTabIndicator extends Decoration {
  final BoxPainter _painter;

  UnderlineArrowTabIndicator({required Color color, required double radius})
    : _painter = _CirclePainter(color, radius);

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) => _painter;
}

class _CirclePainter extends BoxPainter {
  final Paint _paint;
  final double radius;

  _CirclePainter(Color color, this.radius)
    : _paint = Paint()
        ..color = color
        ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    const double tickness = 1.0;
    final Rect rect = (offset - const Offset(0, tickness)) & cfg.size!;

    final paint = Paint()
      ..color = const Color(0xffff5800)
      ..strokeWidth = tickness;
    canvas.drawLine(rect.bottomLeft, rect.bottomRight, paint);
    canvas.drawPath(
      getTrianglePath(rect.bottomCenter.dx, rect.bottomCenter.dy, 4),
      paint,
    );
  }

  Path getTrianglePath(double x, double y, double size) {
    return Path()
      ..moveTo(x, y)
      ..lineTo(x - size, y)
      ..lineTo(x, y - size)
      ..lineTo(x + size, y)
      ..close();
  }
}
