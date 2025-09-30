import 'dart:async';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:victory/components/button/button.dart';
import 'package:victory/constants/string.dart';
import 'package:victory/iconfont/iconfont.dart';
import 'package:victory/shared/dialogs/dialog_luck_spin.dart';
import 'package:victory/theme/theme.dart';
import 'package:victory/shared/lottie/lottie.dart';
part 'dialog_view.dart';
part 'dialog_success.dart';

abstract class VicDialog {
  static Future<T> alert<T>({
    final String? title,
    final String? content,
    final Widget? child,
    final String? confirmText,
    final VoidCallback? onConfirm,
    final bool? autoClose,
    final bool? barrierDismissible,
  }) {
    return show<T>(
      title: title,
      content: content,
      child: child,
      confirmText: confirmText,
      onConfirm: onConfirm,
      autoClose: autoClose,
      barrierDismissible: barrierDismissible,
      showCancel: false,
    );
  }

  static Future<T> confirm<T>({
    final String? title,
    final String? content,
    final Widget? child,
    final String? cancelText,
    final String? confirmText,
    final VoidCallback? onCancel,
    final VoidCallback? onConfirm,
    final bool? autoClose,
    final bool? barrierDismissible,
  }) {
    return show<T>(
      title: title,
      content: content,
      child: child,
      cancelText: cancelText,
      confirmText: confirmText,
      showConfirm: true,
      showCancel: true,
      onCancel: onCancel,
      onConfirm: onConfirm,
      autoClose: autoClose,
      barrierDismissible: barrierDismissible,
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
        return _VicSuccessDialogView(
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

  static Future<T> show<T>({
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
    final bool? barrierDismissible,
  }) async {
    final completer = Completer<T>();
    final r = await Get.dialog<T>(
      barrierDismissible: barrierDismissible ?? true,
      _VicQuickDialogView(
        title: title,
        content: content,
        cancelText: cancelText,
        confirmText: confirmText,
        onCancel: onCancel,
        onConfirm: onConfirm,
        showCancel: showCancel ?? false,
        showConfirm: showConfirm,
        autoClose: autoClose,
        child: child,
      ),
    );
    if (r == null) {
      completer.completeError(cancelTextConst, StackTrace.current);
    } else {
      completer.complete(r);
    }
    return completer.future;
  }

  static Future<void> luckyspin({
    required String title,
    String? buttonText,
    required VoidCallback onTap,
  }) {
    return Get.dialog(
      DialogLuckSpin(
        title: title,
        buttonText: buttonText,
        onTap: onTap,
      ),
    );
  }
}
