import 'package:defer_pointer/defer_pointer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    this.backgroundColor,
    this.closePosition = const (top: -48.0, right: 24.0),
    this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: canPop,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DeferredPointerHandler(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Dialog(
                  alignment: alignment,
                  backgroundColor: backgroundColor,
                  insetPadding: EdgeInsets.symmetric(horizontal: margin),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: Padding(padding: padding, child: child),
                ),
                closeButton(),
              ],
            ),
          ),
        ],
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
          onTap: Get.back,
          child: close ?? const Icon(IconFont.guanbi, size: 36, color: AppColors.white),
        ),
      ),
    );
  }
}
