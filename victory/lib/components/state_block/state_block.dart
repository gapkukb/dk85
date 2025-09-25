import 'package:victory/theme/theme.dart';
import 'package:victory/components/button/button.dart';
import 'package:victory/iconfont/iconfont.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VicStateBlock extends StatelessWidget {
  final String? buttonText;
  final String? text;
  final VoidCallback? onPressed;
  const VicStateBlock({super.key, this.buttonText, this.text = 'app.state.empty', this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(IconFont.nothing, size: 108, color: AppColors.description),
          if (text != null)
            Padding(
              padding: AppSizes.pad_y_48,
              child: Text(text!.tr, style: const TextStyle(fontSize: 14, color: AppColors.description)),
            ),
          if (buttonText != null && onPressed != null) VicButton(onPressed: onPressed, text: buttonText, height: 32),
          SizedBox(height: Get.height / 4),
        ],
      ),
    );
  }
}
