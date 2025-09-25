import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:victory/components/zoom_fade_infinite/zoom_fade_infinite.dart';

class VicModalAnimatedBackground extends StatelessWidget {
  final Widget child;
  final double scale;
  final Alignment alignment;
  const VicModalAnimatedBackground({super.key, required this.child, this.scale = 1.2, this.alignment = const Alignment(0, 0)});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.loose,
      alignment: const Alignment(0, 0),
      children: [
        Positioned.fill(
          child: Transform.scale(
            scale: scale,
            child: background,
          ),
        ),
        child,
      ],
    );
  }

  Widget get background {
    return RepaintBoundary(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final w = constraints.minWidth;
          final h = constraints.minHeight;
          return Stack(
            alignment: alignment,
            children: [
              SizedBox(
                width: w,
                height: h,
              ),
              Positioned(
                child: Image.asset(
                  'assets/images/dialog_animated_lighting.webp',
                  alignment: const Alignment(0, 0),
                  scale: 0.2,
                ).spin(infinite: true, duration: const Duration(seconds: 5)),
              ),
              Positioned(
                child: ZoomFadeInfinite(
                  child: Image.asset(
                    'assets/images/dialog_animated_circle.webp',
                    alignment: const Alignment(0, 0),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
