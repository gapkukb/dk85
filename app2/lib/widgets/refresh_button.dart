import 'package:flutter/material.dart';

class RefreshButton extends StatefulWidget {
  final Widget child;
  final int durationInSeconds;
  final Future Function() onPressed;

  const RefreshButton({super.key, required this.child, this.durationInSeconds = 2, required this.onPressed});

  @override
  _RefreshButtonState createState() => _RefreshButtonState();
}

class _RefreshButtonState extends State<RefreshButton> with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<double> animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: widget.durationInSeconds),
    );
    animation = Tween<double>(
      begin: 0,
      end: 12.5664, // 2Radians (360 degrees)
    ).animate(controller);

    // controller.forward();

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.repeat();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) => Transform.rotate(
        angle: animation.value,
        child: GestureDetector(
          onTap: () {
            if (controller.isAnimating) return;
            controller.forward();
            widget.onPressed().whenComplete(() {
              controller.stop();
            });
          },
          child: widget.child,
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
