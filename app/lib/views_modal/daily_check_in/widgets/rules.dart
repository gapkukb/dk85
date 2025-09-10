import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';

class DailyCheckInRules extends StatelessWidget {
  const DailyCheckInRules({super.key});

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
          Text('အောင်မြင်စွာဝင်ရောက်ပါ။', style: TextStyle()),
          const SizedBox(height: 8),
          Text('1. You can check in once a day.', style: TextStyle()),
        ],
      ),
    );
  }
}
