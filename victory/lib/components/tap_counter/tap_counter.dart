import "package:flutter/gestures.dart";
import 'package:flutter/material.dart';

class VicTapCounter extends StatelessWidget {
  final Widget child;
  final int count;
  final void Function(int count)? onTaps;

  const VicTapCounter({Key? key, required this.child, this.count = 1, this.onTaps}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (count <= 0 || this.onTaps == null) return child;
    return RawGestureDetector(
      gestures: {
        SerialTapGestureRecognizer: GestureRecognizerFactoryWithHandlers<SerialTapGestureRecognizer>(SerialTapGestureRecognizer.new, (
          SerialTapGestureRecognizer instance,
        ) {
          instance.onSerialTapDown = (SerialTapDownDetails details) {
            if (details.count == count) {
              this.onTaps!(details.count);
            }
          };
        }),
      },

      child: child,
    );
  }
}
