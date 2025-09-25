import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:victory/theme/theme.dart';

class VicDailyCheckInRules extends StatelessWidget {
  final String rules;
  const VicDailyCheckInRules({super.key, required this.rules});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      constraints: BoxConstraints(minHeight: Get.height / 2),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('dci.rules'.tr, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(rules, style: const TextStyle(color: AppColors.label)),
        ],
      ),
    );
  }
}
