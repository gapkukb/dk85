import 'package:app/iconfont/index.dart';
import 'package:app/theme/index.dart';
import 'package:app/widgets/button/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StateBlock extends StatelessWidget {
  final String? buttonText;
  final String? text;
  final VoidCallback? onPressed;
  const StateBlock({super.key, this.buttonText, this.text = 'app.state.empty', this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(IconFont.nothing, size: 108, color: AppColors.description),
          if (text != null)
            Padding(
              padding: Gutter.vertical.xlarge,
              child: Text(text!.tr, style: TextStyle(fontSize: 14, color: AppColors.description)),
            ),
          if (buttonText != null && onPressed != null) AKButton(onPressed: onPressed, text: buttonText, height: 32),
          SizedBox(height: Get.height / 4),
        ],
      ),
    );
  }
}
