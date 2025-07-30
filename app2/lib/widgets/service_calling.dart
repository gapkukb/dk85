import '../iconfont/index.dart';
import '../routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServiceCalling extends StatelessWidget {
  final Widget? child;
  const ServiceCalling({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.CUSTOMER_SERVICE);
      },
      child: child ?? const Icon(IconFont.kefu),
    );
  }
}
