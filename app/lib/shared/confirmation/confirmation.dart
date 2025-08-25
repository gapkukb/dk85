import 'package:app/theme/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

const _kTitleStyle = TextStyle(fontSize: 14);
const _kContentStyle = TextStyle(fontSize: 12, color: AppColors.label);
const _kConfirmStyle = TextStyle(fontSize: 12, color: AppColors.highlight);
const _kCancelStyle = TextStyle(fontSize: 12, color: AppColors.label);

extension Confirmation on GetInterface {
  Future<bool?> confirm({
    bool? barrierDismissible,
    String? title,
    String? content,
    String? cancel,
    String? confirm,
    TextStyle? titleStyle,
    TextStyle? contentStyle,
    TextStyle? cancelStyle,
    TextStyle? confirmStyle,
  }) {
    return Get.dialog<bool>(
      barrierDismissible: barrierDismissible ?? true,
      CupertinoAlertDialog(
        title: Text(
          title ?? 'app.confirm'.tr,
          style: _kTitleStyle.merge(titleStyle),
        ),
        content: content == null
            ? null
            : Text(content, style: _kContentStyle.merge(contentStyle)),
        actions: [
          CupertinoDialogAction(
            onPressed: Get.back,
            child: Text(
              cancel ?? 'app.cancel'.tr,
              style: _kCancelStyle.merge(cancelStyle),
            ),
          ),

          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Get.back(result: true);
            },
            child: Text(
              confirm ?? 'app.confirm'.tr,
              style: _kConfirmStyle.merge(confirmStyle),
            ),
          ),
        ],
      ),
    );
  }
}
