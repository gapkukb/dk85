import 'dart:async';

import 'package:dotlottie_loader/dotlottie_loader.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottiePlayer {
  final DotLottieLoader loader;
  final Future<dynamic> completer;

  LottiePlayer({required this.loader, required this.completer});
}

LottiePlayer lottiePlayer({
  required String assetPath,
  double width = 156,
  double height = 156,
  bool repeat = false,
}) {
  print('123');
  final completer = Completer();
  final widget = DotLottieLoader.fromAsset(
    assetPath,
    frameBuilder: (BuildContext ctx, DotLottie? dotlottie) {
      if (dotlottie != null) {
        return Lottie.memory(
          addRepaintBoundary: true,
          dotlottie.animations.values.single,
          width: width,
          height: height,
          repeat: repeat,
          onLoaded: (composition) {
            Future.delayed(composition.duration, () {
              completer.complete();
            });
          },
        );
      } else {
        return SizedBox(); // Or a loading indicator
      }
    },
  );

  return LottiePlayer(loader: widget, completer: completer.future);
}
