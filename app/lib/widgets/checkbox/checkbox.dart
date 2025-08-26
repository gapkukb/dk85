import 'package:app/iconfont/index.dart';
import 'package:app/theme/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AKCheckbox extends StatelessWidget {
  final ValueChanged<bool?>? onChanged;
  final bool value;

  const AKCheckbox({super.key, required this.onChanged, this.value = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged?.call(!value);
      },
      child: Wrap(
        spacing: 4,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Icon(
            value ? IconFont.selected : IconFont.unselected,
            size: 20,
            color: value ? AppColors.primary : AppColors.label,
          ),
          Text(
            "login.remember".tr,
            style: TextStyle(fontSize: 12, color: AppColors.title),
          ),
        ],
      ),
    );
  }
}
