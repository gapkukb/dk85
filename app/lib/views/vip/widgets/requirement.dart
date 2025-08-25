import 'package:app/theme/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../index.dart';

/// hello
class RequirementWidget extends GetView<VipController> {
  const RequirementWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.amber,
      height: 36,
      child: Column(
        children: [
          LinearProgressIndicator(
            stopIndicatorRadius: 10,
            borderRadius: BorderRadius.circular(10),
            value: 0.5,
          ),
          Row(
            children: [
              Text(
                'ပေါင်းစည်းခြင် ',
                style: TextStyle(fontSize: 12, color: AppColors.label),
              ),
              Text(
                '3000.00',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: AppColors.highlight,
                  height: 2.5,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
