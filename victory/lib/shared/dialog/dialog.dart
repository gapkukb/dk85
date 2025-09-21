import 'dart:async';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../components/button/button.dart';
import '../../theme/theme.dart';
import '../lottie/lottie.dart';

part 'dialog_impl.dart';
part 'dialog_success.dart';

abstract class VicDialog {
  static Future<void> alert({
    final String? title,
    final String? content,
    final Widget? child,
    final String? cancelText,
    final String? confirmText,
    final VoidCallback? onCancel,
    final VoidCallback? onConfirm,
    final bool? showCancel,
    final bool? showConfirm,
    final bool? autoClose,
  }) {
    return Get.dialog(
      _VicDialogView(
        title: title,
        content: content,
        child: child,
        cancelText: cancelText,
        confirmText: confirmText,
        onCancel: onCancel,
        onConfirm: onConfirm,
        showCancel: showCancel ?? false,
        showConfirm: showConfirm,
        autoClose: autoClose,
      ),
      barrierDismissible: false,
    );
  }

  static Future<void> confirm({
    final String? title,
    final String? content,
    final Widget? child,
    final String? cancelText,
    final String? confirmText,
    final VoidCallback? onCancel,
    final VoidCallback? onConfirm,
    final bool? showCancel,
    final bool? showConfirm,
    final bool? autoClose,
  }) {
    return Get.dialog(
      _VicDialogView(
        title: title,
        content: content,
        child: child,
        cancelText: cancelText,
        confirmText: confirmText,
        onCancel: onCancel,
        onConfirm: onConfirm,
        showCancel: showCancel,
        showConfirm: showConfirm,
        autoClose: autoClose,
      ),
      barrierDismissible: false,
    );
  }

  static Future<void> prompt() async {}
  static Future<void> success({
    String? text = 'Opration Successful',
    Widget? widget,
    VoidCallback? onClose,
  }) async {
    final c = Completer<void>();
    BotToast.showCustomLoading(
      toastBuilder: (cancelFunc) {
        return _VicDialogSuccess(
          text: text,
          onClose: cancelFunc,
          widget: widget,
        );
      },
      onClose: () {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          c.complete();
          onClose?.call();
        });
      },
    );
    return c.future;
  }
}
