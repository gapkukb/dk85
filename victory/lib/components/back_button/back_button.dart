import 'package:flutter/material.dart';

import '../../iconfont/iconfont.dart';

class VicBackButton extends StatelessWidget {
  const VicBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MaterialButton(
        height: 36,
        minWidth: 36,
        elevation: 0,
        highlightElevation: 0,
        shape: const StadiumBorder(),
        padding: const EdgeInsets.all(0),
        onPressed: () {
          Navigator.maybePop(context);
        },
        color: Colors.white,
        child: const Icon(IconFont.arrow_left, size: 20),
      ),
    );
  }
}
