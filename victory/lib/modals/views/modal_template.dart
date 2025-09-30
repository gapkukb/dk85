import 'package:animate_do/animate_do.dart';
import 'package:defer_pointer/defer_pointer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:victory/modals/views/modal_action_button.dart';

import '../../iconfont/iconfont.dart';
import '../../theme/theme.dart';

class VicModalTemplate extends StatelessWidget {
  final Widget child;
  final Alignment? alignment;
  final ({double top, double right}) closePosition;
  final Widget Function(BuildContext context, Widget child)? builder;
  final bool canPop;
  final bool showClose;
  final Widget? close;
  final Color? backgroundColor;
  final double? insetBottom;
  final double margin;
  final EdgeInsets padding;
  final BoxDecoration? decoration;
  final BoxDecoration? foregroundDecoration;
  final String? title;
  final String? subtitle;
  final String? buttoText;
  final VoidCallback? onCancel;
  final VoidCallback? onConfirm;
  final VoidCallback? onClose;
  const VicModalTemplate({
    super.key,
    required this.child,
    this.builder,
    this.canPop = false,
    this.showClose = true,
    this.close,
    this.insetBottom,
    this.margin = 24,
    this.padding = const EdgeInsets.symmetric(horizontal: 12),
    this.decoration,
    this.foregroundDecoration,
    this.backgroundColor,
    this.closePosition = const (top: -48.0, right: 24.0),
    this.alignment,
    this.title,
    this.subtitle,
    this.buttoText,
    this.onCancel,
    this.onConfirm,
    this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) return;
          onCancel?.call();
          Get.back();
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DeferredPointerHandler(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 12,
                    children: [
                      Dialog(
                        alignment: alignment,
                        backgroundColor: backgroundColor,
                        insetPadding: EdgeInsets.symmetric(horizontal: margin),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        child: Padding(padding: padding, child: child),
                      ),
                      if (title != null)
                        Text(
                          title!,
                          style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      if (subtitle != null)
                        Text(
                          subtitle!,
                          style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      if (buttoText != null)
                        VicModalActionButton(
                          text: buttoText!,
                          onTap: onConfirm,
                        ),
                      // .pulse(
                      //   from: 1,
                      //   to: 1.1,
                      //   infinite: true,
                      // ),
                    ],
                  ),
                  closeButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget closeButton() {
    if (!showClose) return const SizedBox.shrink();
    return Positioned(
      top: closePosition.top,
      right: closePosition.right,
      child: DeferPointer(
        child: GestureDetector(
          onTap: () {
            onCancel?.call();
            Get.back();
          },
          child: close ?? const Icon(IconFont.guanbi, size: 36, color: AppColors.white),
        ),
      ),
    );
  }
}
