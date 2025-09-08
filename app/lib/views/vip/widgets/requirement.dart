import 'package:app/theme/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../index.dart';

/// hello
class RequirementWidget extends GetView<VipController> {
  final String name;
  final num limit;
  final double precent;
  const RequirementWidget({super.key, required this.name, required this.limit, required this.precent});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.amber,
      height: 36,
      child: Column(
        children: [
          LinearProgressIndicator(stopIndicatorRadius: 10, borderRadius: BorderRadius.circular(10), value: precent),
          Row(
            children: [
              Text(name, style: TextStyle(fontSize: 12, color: AppColors.label)),
              Text(
                '$limit',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.highlight, height: 2.5),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
