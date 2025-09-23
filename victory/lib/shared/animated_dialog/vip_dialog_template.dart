import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../components/zoom_fade_infinite/zoom_fade_infinite.dart';

class VipDialogTemplate extends StatelessWidget {
  final List<Widget> children;
  const VipDialogTemplate({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Positioned(
          left: -50,
          right: -50,
          child: RepaintBoundary(
            child: Image.asset(
              'assets/images/animation_lighting.webp',
              alignment: const Alignment(0, 0),
              width: size.width,
              height: size.height,
              scale: 0.2,
            ).spin(infinite: true, duration: const Duration(seconds: 5)),
          ),
        ),
        Positioned(
          left: -50,
          right: -50,
          child: RepaintBoundary(
            child: ZoomFadeInfinite(
              child: Image.asset('assets/images/animation_circle.webp', alignment: const Alignment(0, 0), width: size.width, height: size.height),
            ),
          ),
        ),
        Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          insetPadding: const EdgeInsets.symmetric(horizontal: 48),
          child: const SizedBox(),
        ),
      ],
    );
  }
}
