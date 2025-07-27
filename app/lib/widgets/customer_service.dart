import 'package:app/iconfont/index.dart';
import 'package:app/router/index.dart';
import 'package:app/theme/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void callService() {
  Get.toNamed(Routes.customerService);
}

class CustomerServiceButton extends StatelessWidget {
  final Widget? child;
  const CustomerServiceButton({super.key, this.child});
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      sizeStyle: CupertinoButtonSize.small,
      padding: EdgeInsets.all(0),
      color: AppColor.main,
      onPressed: callService,
      child: Row(children: [Icon(IconFont.kefu, color: Colors.white)]),
    );
  }
}
