import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/button/button.dart';

class VicDialogView extends StatelessWidget {
  final String? title;
  final String? content;
  final Widget? child;
  final String? cancelText;
  final String? confirmText;
  final VoidCallback? onCancel;
  final VoidCallback? onConfirm;
  final bool showCancel;
  final bool showConfirm;
  final bool autoClose;

  const VicDialogView({
    super.key,
    this.title,
    this.content,
    this.cancelText,
    this.confirmText,
    this.onCancel,
    this.onConfirm,
    this.child,
    this.showCancel = true,
    this.showConfirm = true,
    this.autoClose = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        spacing: 8,
        children: [
          const Text('title'),
          const Text('content'),
          // actions
          Row(
            spacing: 8,
            children: [
              VicButton(
                text: 'app.cancel'.tr,
                onPressed: () => Get.back(),
              ),
              VicButton(
                text: 'app.confrim'.tr,
                onPressed: () {
                  Get.back();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  VicDialogView.alert({
    super.key,
    this.cancelText,
    this.child,
    this.confirmText,
    this.content,
    this.onCancel,
    this.onConfirm,
    this.title,
    this.showCancel = false,
    this.showConfirm = true,
    this.autoClose = true,
  });
  VicDialogView.confirm({
    super.key,
    this.cancelText,
    this.child,
    this.confirmText,
    this.content,
    this.onCancel,
    this.onConfirm,
    this.title,
    this.showCancel = true,
    this.showConfirm = true,
    this.autoClose = true,
  });
}
