import 'package:flutter/material.dart';

import '../../styles/styles.dart';

class VipBadge extends StatelessWidget {
  final int level;
  const VipBadge({Key? key, required this.level}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        height: 100,
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        decoration: BoxDecoration(color: AppColor.warn, borderRadius: BorderRadius.circular(100)),
        child: Text(
          'vip$level',
          style: const TextStyle(fontSize: 86, color: AppColor.highlight, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, height: 1),
        ),
      ),
    );
  }
}
