import 'package:app/theme/index.dart';
import 'package:app/views/funds/funds_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class FundsPresetAmount extends GetView<FundsController> {
  final List<String> presets;
  const FundsPresetAmount(this.presets, {super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisExtent: 44,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: presets.length,
      itemBuilder: (BuildContext context, int index) {
        final n = presets[index];
        return Obx(
          () => _Button(
            onPressed: () {
              controller.setAmount(n);
            },
            text: n,
            selected: controller.amount.value == n,
          ),
        );
      },
    );
  }
}

class _Button extends OutlinedButton {
  final String text;
  final bool selected;
  _Button({required super.onPressed, required this.text, this.selected = false})
    : super(
        style: OutlinedButton.styleFrom(
          backgroundColor: selected ? AppColors.primary : null,
          side: BorderSide(
            color: selected ? AppColors.primary : AppColors.border,
            width: 1,
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
        child: Text(
          text,
          style: TextStyle(color: selected ? AppColors.white : AppColors.title),
        ),
      );
}
