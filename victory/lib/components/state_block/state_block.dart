import '../../styles/styles.dart';
import '../button/button.dart';
import '/iconfont/iconfont.dart';
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
          const Icon(IconFont.nothing, size: 108, color: AppColor.description),
          if (text != null)
            Padding(
              padding: AppSize.pad_y_48,
              child: Text(text!.tr, style: const TextStyle(fontSize: 14, color: AppColor.description)),
            ),
          if (buttonText != null && onPressed != null) VicButton(onPressed: onPressed, text: buttonText, height: 32),
          SizedBox(height: Get.height / 4),
        ],
      ),
    );
  }
}
