import 'package:flutter/material.dart';

import 'package:victory/theme/theme.dart';

class VipBadge extends StatelessWidget {
  final int level;
  const VipBadge({super.key, required this.level});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        alignment: const Alignment(0, 0),
        height: 100,
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        decoration: BoxDecoration(color: AppColors.fffac4, borderRadius: BorderRadius.circular(100)),
        child: Text(
          'vip$level',
          style: const TextStyle(fontSize: 80, color: AppColors.highlight, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, height: 1),
        ),
      ),
    );
  }
}
