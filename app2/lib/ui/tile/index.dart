import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/symbols.dart';

import '/theme/index.dart';

class AkTile extends StatelessWidget {
  static const arrowIcon = Icon(Symbols.arrow_forward_ios, size: 16, color: AppColors.description);
  static const padding = EdgeInsets.only(left: 16, top: 0, bottom: 0, right: 8);

  final TextStyle? valueStyle;
  final TextStyle? titleStyle;
  final String? titleText;
  final Widget? title;
  final String? valueText;
  final Widget? value;
  final Widget? leading;
  final bool? isLink;
  final VoidCallback? onTap;
  final String? to;
  final String? arrowDirection;
  final double arrowMargin;

  const AkTile({
    super.key,
    this.titleText,
    this.title,
    this.valueText,
    this.value,
    this.leading,
    this.isLink,
    this.onTap,
    this.to,
    this.arrowDirection,
    this.arrowMargin = 4.0,
    this.titleStyle,
    this.valueStyle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading,
      leadingAndTrailingTextStyle: valueStyle,
      title: title ?? (titleText == null ? null : Text(titleText!, style: titleStyle)),
      trailing: buildTrailing(),
      onTap: computeHandle(context),
      contentPadding: padding,
    );
  }

  buildArrow() {
    return isLink == null ? null : arrowIcon;
  }

  buildAddition() {
    if (value == null && valueText == null) return;

    return value ??
        Padding(
          padding: const EdgeInsets.only(right: 4),
          child: Text(valueText!, style: valueStyle),
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
