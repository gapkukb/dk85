import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../button/index.dart';

class AkActionsheet extends StatelessWidget {
  final Widget child;
  const AkActionsheet(this.child, {super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(8),
        constraints: BoxConstraints(maxHeight: Get.height / 2, minHeight: 0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              clipBehavior: Clip.antiAlias,
              borderRadius: BorderRadius.circular(8),
              child: Material(type: MaterialType.transparency, child: child),
            ),
            const SizedBox(height: 8),
            Button(
              onPressed: () {
                Get.back();
              },
              text: "取消",
              color: Colors.white,
              minWidth: 1000,
              radius: 8,
            ),
          ],
        ),
      ),
    );
  }
}
