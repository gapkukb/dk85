import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/symbols.dart';

import '/theme/index.dart';

class AkTile extends StatelessWidget {
  static const arrowIcon = Icon(Symbols.arrow_forward_ios, size: 16, color: AppColors.description);
  static const padding = EdgeInsets.only(left: 16, top: 0, bottom: 0, right: 8);

  final String? title;
  final Widget? titleWidget;
  final TextStyle? titleStyle;
  final int? titleMaxLines;
  final String? subtitle;
  final Widget? subtitleWidget;
  final TextStyle? subtitleStyle;
  final int? subtitleMaxLines;
  final String? value;
  final TextStyle? valueStyle;
  final Widget? valueWidget;
  final IconData? icon;
  final Widget? leading;
  final bool? isLink;
  final VoidCallback? onTap;
  final String? to;
  final String? arrowDirection;
  final double arrowMargin;

  const AkTile({
    super.key,
    this.title,
    this.titleWidget,
    this.value,
    this.valueWidget,
    this.leading,
    this.isLink,
    this.onTap,
    this.to,
    this.arrowDirection,
    this.arrowMargin = 4.0,
    this.titleStyle,
    this.valueStyle,
    this.icon,
    this.subtitle,
    this.subtitleMaxLines,
    this.subtitleStyle,
    this.subtitleWidget,
    this.titleMaxLines,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading,
      leadingAndTrailingTextStyle: valueStyle,
      title: buildText(titleWidget, title, titleMaxLines),
      subtitle: buildText(subtitleWidget, subtitle, subtitleMaxLines),
      trailing: buildTrailing(),
      onTap: computeHandle(context),
      contentPadding: padding,
    );
  }

  buildText(Widget? widget, String? text, int? maxLines) {
    if (widget != null) return widget;
    if (text == null) return;
    return Text(title!, style: titleStyle, maxLines: titleMaxLines, overflow: TextOverflow.ellipsis);
  }

  buildArrow() {
    return isLink == null ? null : arrowIcon;
  }

  buildAddition() {
    if (valueWidget != null) return valueWidget;
    if (value == null) return;
    return Padding(
      padding: const EdgeInsets.only(right: 4),
      child: Text(value!, style: valueStyle),
    );
  }

  buildTrailing() {
    final arrow = buildArrow();
    final addition = buildAddition();

    late final Widget? trailing;
    if (arrow != null && addition != null) {
      trailing = Wrap(crossAxisAlignment: WrapCrossAlignment.center, spacing: arrowMargin, children: [addition, arrow]);
    } else if (arrow != null || addition != null) {
      trailing = arrow ?? addition;
    } else {
      trailing = null;
    }

    return trailing;
  }

  VoidCallback? computeHandle(BuildContext context) {
    if (onTap != null) return onTap;
    if (to == null) return null;
    return () {
      Get.toNamed(to!);
    };
  }
}

class AkTileGroup extends CupertinoListSection {
  const AkTileGroup({
    super.key,
    super.additionalDividerMargin = 16,
    super.backgroundColor,
    super.children,
    super.clipBehavior,
    super.decoration,
    super.dividerMargin = 0,
    super.footer,
    super.hasLeading,
    super.header,
    super.margin,
    super.separatorColor,
    super.topMargin = 16,
  });
}
