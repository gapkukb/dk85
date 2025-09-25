import "package:flutter/gestures.dart";
import 'package:flutter/material.dart';

class VicTapCounter extends StatelessWidget {
  final Widget child;
  final int count;
  final void Function(int count)? onTaps;

  const VicTapCounter({super.key, required this.child, this.count = 1, this.onTaps});

  @override
  Widget build(BuildContext context) {
    if (count <= 0 || onTaps == null) return child;
    return RawGestureDetector(
      gestures: {
        SerialTapGestureRecognizer: GestureRecognizerFactoryWithHandlers<SerialTapGestureRecognizer>(SerialTapGestureRecognizer.new, (
          SerialTapGestureRecognizer instance,
        ) {
          instance.onSerialTapDown = (SerialTapDownDetails details) {
            if (details.count == count) {
              onTaps!(details.count);
            }
          };
        }),
      },

      child: child,
    );
  }
}
