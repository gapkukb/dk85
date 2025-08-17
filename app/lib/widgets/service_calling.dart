import '../iconfont/index.dart';
import '../routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void callService() {
  Get.toNamed(Routes.customerService);
}

class ServiceCalling extends StatelessWidget {
  final Widget? child;
  final double? size;
  final Color? color;
  const ServiceCalling({super.key, this.child, this.color, this.size});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callService,
      child: child ?? Icon(IconFont.kefu, size: size, color: color),
    );
  }
}
