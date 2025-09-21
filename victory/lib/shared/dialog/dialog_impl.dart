import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/button/button.dart';
import '../../styles/styles.dart';

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
    return Dialog(
      // insetPadding: AppSize.pad_a_12,
      shape: const RoundedRectangleBorder(borderRadius: AppSize.radius_a_12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 16,
          children: [
            Text(
              title ?? 'dialog.title'.tr,
              style: AppTextStyle.f14_title_bold,
            ),
            if (child != null) child!,
            if (content != null)
              Padding(
                padding: AppSize.pad_t_4,
                child: Text(
                  content!,
                  style: AppTextStyle.f14_label,
                ),
              ),
            // actions
            Row(
              spacing: 8,
              children: [
                if (showCancel)
                  Expanded(
                    child: VicButton(
                      outlined: true,
                      backgroundColor: Colors.transparent,
                      color: AppColor.primary,
                      text: 'app.cancel'.tr,
                      onPressed: () {
                        Get.back();
                        onCancel?.call();
                      },
                    ),
                  ),
                if (showConfirm)
                  Expanded(
                    child: VicButton(
                      text: 'app.confirm'.tr,
                      onPressed: () {
                        if (autoClose) {
                          Get.back();
                        }
                        onConfirm?.call();
                      },
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  const VicDialogView.alert({
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

  const VicDialogView.confirm({
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
