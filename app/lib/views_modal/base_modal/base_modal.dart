import 'package:app/iconfont/index.dart';
import 'package:app/theme/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BaseModal extends StatefulWidget {
  final Widget child;
  final Widget Function(BuildContext context, Widget child)? builder;
  final bool canPop;
  final bool showClose;
  final Widget? close;
  final Color? backgroundColor;
  final double? insetBottom;
  final double margin;
  final EdgeInsets padding;
  final BoxDecoration? decoration;
  const BaseModal({
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
  });

  @override
  _BaseModalState createState() => _BaseModalState();
}

class _BaseModalState extends State<BaseModal> {
  @override
  Widget build(BuildContext context) {
    final child = Dialog(
      backgroundColor: widget.backgroundColor,
      insetPadding: EdgeInsets.symmetric(horizontal: widget.margin),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(padding: widget.padding, child: widget.child),
    );

    return PopScope(
      canPop: widget.canPop,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: widget.decoration,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (widget.showClose)
              Padding(
                padding: EdgeInsets.only(right: widget.margin, bottom: 8),
                child: GestureDetector(onTap: Get.back, child: buildCloseButton()),
              ),
            widget.builder?.call(context, child) ?? child,
            SizedBox(height: widget.insetBottom ?? Get.height / 10),
          ],
        ),
      ),
    );
  }

  Widget buildCloseButton() {
    if (widget.close != null) return widget.close!;
    return Icon(IconFont.guanbi, size: 36, color: AppColors.white);
  }
}
