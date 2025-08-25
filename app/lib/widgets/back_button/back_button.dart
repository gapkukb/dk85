import 'package:app/iconfont/index.dart';
import 'package:flutter/material.dart';

class AKBackButton extends StatelessWidget {
  const AKBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MaterialButton(
        height: 36,
        minWidth: 36,
        elevation: 0,
        highlightElevation: 0,
        shape: StadiumBorder(),
        padding: EdgeInsets.all(0),
        onPressed: () {
          Navigator.maybePop(context);
        },
        color: Colors.white,
        child: Icon(IconFont.arrow_left, size: 20),
      ),
    );
  }
}
