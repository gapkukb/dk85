import 'package:flutter/material.dart';

class StrokeText extends StatelessWidget {
  final String text;
  final Color strokeColor;
  final double strokeWidth;
  final TextStyle textStyle;
  final TextAlign textAlign;
  final TextDirection textDirection;
  final TextScaler textScaler;
  final TextOverflow? overflow;
  final int? maxLines;
  final List<StrokeParttern>? strokePartterns;

  const StrokeText({
    super.key,
    required this.text,
    this.strokeColor = Colors.amber, // Default stroke color
    this.strokeWidth = 3, // Default stroke width
    this.textStyle = const TextStyle(),
    this.textAlign = TextAlign.start,
    this.textDirection = TextDirection.ltr,
    this.textScaler = TextScaler.noScaling,
    this.overflow,
    this.maxLines,
    this.strokePartterns,
  });

  @override
  Widget build(BuildContext context) {
    final mainTextPainter = TextPainter(
      text: TextSpan(text: text, style: textStyle),
      textAlign: textAlign,
      textDirection: textDirection,
      textScaler: textScaler,
      maxLines: maxLines,
      ellipsis: overflow == TextOverflow.ellipsis ? '...' : null,
    );

    mainTextPainter.layout(maxWidth: double.infinity); // Th

    return CustomPaint(
      size: mainTextPainter.size,
      painter: _TextPainterWithStroke(
        text: text,
        mainTextPainter: mainTextPainter,
        strokeColor: strokeColor,
        strokeWidth: strokeWidth,
        strokePartterns: strokePartterns ?? [],
      ),
    );
  }
}

class _TextPainterWithStroke extends CustomPainter {
  final String text;
  final Color strokeColor;
  final double strokeWidth;
  final TextPainter mainTextPainter;
  final List<StrokeParttern> strokePartterns;

  _TextPainterWithStroke({
    required this.text,
    required this.strokeColor,
    required this.strokeWidth,
    required this.mainTextPainter,
    required this.strokePartterns,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final offset = _calculateOffset(mainTextPainter, size);

    for (final strokeParttern in strokePartterns) {
      final strokeTextStyle = mainTextPainter.text!.style!.copyWith(
        foreground: Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = strokeParttern.width
          ..color = strokeParttern.color,
      );

      final strokePainter = TextPainter(
        text: TextSpan(text: mainTextPainter.text!.toPlainText(), style: strokeTextStyle),
        textAlign: mainTextPainter.textAlign,
        textDirection: mainTextPainter.textDirection,
        textScaler: mainTextPainter.textScaler,
        maxLines: mainTextPainter.maxLines,
        ellipsis: mainTextPainter.ellipsis,
      );

      strokePainter.layout(maxWidth: size.width);
      // Draw the stroke first
      strokePainter.paint(canvas, offset);
    }
    // Then draw the main text
    mainTextPainter.paint(canvas, offset);
  }

  // Helper method to calculate the offset based on text alignment
  Offset _calculateOffset(TextPainter painter, Size size) {
    switch (painter.textAlign) {
      case TextAlign.center:
        return Offset(
          (size.width - painter.width) / 2,
          (size.height - painter.height) / 2,
        );
      case TextAlign.end:
        return Offset(
          size.width - painter.width,
          (size.height - painter.height) / 2,
        );
      case TextAlign.left:
        return Offset(
          0,
          (size.height - painter.height) / 2,
        );
      case TextAlign.right:
        return Offset(
          size.width - painter.width,
          (size.height - painter.height) / 2,
        );
      case TextAlign.justify:
      case TextAlign.start:
      default:
        return Offset(
          0,
          (size.height - painter.height) / 2,
        );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class StrokeParttern {
  final Color color;
  final double width;

  const StrokeParttern(this.color, this.width);
}
