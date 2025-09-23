import 'package:flutter/material.dart';

class ZoomFadeInfinite extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final double scaleBegin;
  final double scaleEnd;
  final double opacityBegin;
  final double opacityEnd;
  final Curve curve;

  const ZoomFadeInfinite({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 3000),
    this.scaleBegin = 0,
    this.scaleEnd = 1.2,
    this.opacityBegin = 1,
    this.opacityEnd = 0,
    this.curve = Curves.easeInOut,
  });

  @override
  State<ZoomFadeInfinite> createState() => _ZoomFadeInfiniteState();
}

class _ZoomFadeInfiniteState extends State<ZoomFadeInfinite> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnim;
  late final Animation<double> _opacityAnim;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: widget.duration)..repeat();

    final curved = CurvedAnimation(parent: _controller, curve: widget.curve);

    _scaleAnim = Tween<double>(begin: widget.scaleBegin, end: widget.scaleEnd).animate(curved);

    _opacityAnim = Tween<double>(begin: widget.opacityBegin, end: widget.opacityEnd).animate(curved);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacityAnim,
      child: ScaleTransition(scale: _scaleAnim, child: widget.child),
    );
  }
}
