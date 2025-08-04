import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class Balance extends StatefulWidget {
  final Widget child;
  final Widget Function(double amount, Widget child) builder;
  const Balance({super.key, required this.builder, required this.child});

  @override
  State<Balance> createState() => _BalanceState();
}

class _BalanceState extends State<Balance> {
  var amount = 0.0;

  late final AnimationController controller;
  late final Widget trigger;

  @override
  void initState() {
    super.initState();
    trigger =
        GestureDetector(
              onTap: () {
                if (controller.isAnimating) return;
                controller.repeat();
                Future.delayed(3000.ms).whenComplete(() {
                  setState(() {
                    amount = double.parse(Random().nextDouble().toStringAsFixed(2));
                    controller.stop();
                  });
                });
              },
              child: widget.child,
            )
            .animate(
              autoPlay: true,
              onInit: (controller_) {
                controller = controller_;
              },
            )
            .rotate(duration: 1500.ms);
  }

  @override
  Widget build(BuildContext context) {
    // return const Text("data");
    return widget.builder(amount, trigger);
  }
}
