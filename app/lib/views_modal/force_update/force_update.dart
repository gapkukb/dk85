import 'package:app/theme/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

part 'update_app.dart';

class ForceUpdateModal extends StatelessWidget {
  final String? title;
  final String? content;
  final String cancelText;
  final String confirmText;
  final bool autoClose;
  final bool showCancel;
  final void Function(Function close)? onCancel;
  final void Function(Function close)? onConfirm;

  const ForceUpdateModal({
    super.key,
    this.title,
    this.content,
    this.cancelText = 'app.cancel',
    this.confirmText = 'app.confirm',
    this.autoClose = true,
    this.showCancel = true,
    this.onCancel,
    this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    final isForce = false;
    return PopScope(
      canPop: false,
      child: AlertDialog(
        // insetPadding: EdgeInsets.symmetric(horizontal: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        title: title == null ? null : Text(title!, textAlign: TextAlign.center),
        titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: AppColors.highlight),
        content: title == null ? null : Text(content!),
        // actionsAlignment: MainAxisAlignment.center,
        actionsOverflowDirection: VerticalDirection.down,
        actions: [
          ButtonTheme(
            padding: EdgeInsets.zero,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              spacing: 8,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (showCancel)
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        _updateApp(isForce);
                        _close();
                        onCancel?.call(_close);
                      },
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.all(0),
                        side: BorderSide(color: AppColors.description),
                      ),
                      child: Text(cancelText.tr, style: TextStyle(color: AppColors.description)),
                    ),
                  ),
                Expanded(
                  child: FilledButton(
                    onPressed: () {
                      onConfirm?.call(_close);
                      _close();
                    },
                    style: FilledButton.styleFrom(padding: EdgeInsets.all(0)),
                    child: Text(confirmText.tr, style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _close() {
    if (autoClose) {
      Get.back();
    }
  }
}
