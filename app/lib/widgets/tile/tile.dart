import 'package:app/iconfont/index.dart';
import 'package:app/theme/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';

class AKTile extends StatelessWidget {
  final Widget? leading;
  final Widget? title;
  final String? titleText;
  final Widget? subtitle;
  final Widget? trailing;
  final bool? isThreeLine;
  final bool? dense;
  final VisualDensity? visualDensity;
  final ShapeBorder? shape;
  final Color? selectedColor;
  final Color? iconColor;
  final Color? textColor;
  final TextStyle? titleTextStyle;
  final TextStyle? subtitleTextStyle;
  final TextStyle? leadingAndTrailingTextStyle;
  final ListTileStyle? style;
  final EdgeInsetsGeometry? contentPadding;
  final bool enabled;
  final GestureTapCallback? onTap;
  final GestureLongPressCallback? onLongPress;
  final ValueChanged<bool>? onFocusChange;
  final MouseCursor? mouseCursor;
  final bool selected;
  final Color? focusColor;
  final Color? hoverColor;
  final Color? splashColor;
  final FocusNode? focusNode;
  final bool autofocus;
  final Color? tileColor;
  final Color? selectedTileColor;
  final bool? enableFeedback;
  final double? horizontalTitleGap;
  final double? minVerticalPadding;
  final double? minLeadingWidth;
  final double? minTileHeight;
  final ListTileTitleAlignment? titleAlignment;
  final bool internalAddSemanticForOnTap;
  final bool isLink;
  final String? to;

  const AKTile({
    super.key,
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
    this.isThreeLine,
    this.dense,
    this.visualDensity,
    this.shape,
    this.selectedColor,
    this.iconColor,
    this.textColor,
    this.titleTextStyle,
    this.subtitleTextStyle,
    this.leadingAndTrailingTextStyle,
    this.style,
    this.contentPadding,
    this.onTap,
    this.onLongPress,
    this.onFocusChange,
    this.mouseCursor,
    this.focusColor,
    this.hoverColor,
    this.splashColor,
    this.focusNode,
    this.tileColor,
    this.selectedTileColor,
    this.enableFeedback,
    this.horizontalTitleGap,
    this.minVerticalPadding,
    this.minLeadingWidth,
    this.minTileHeight,
    this.titleAlignment,
    this.enabled = true,
    this.selected = false,
    this.autofocus = false,
    this.internalAddSemanticForOnTap = true,
    this.titleText,
    this.isLink = true,
    this.to,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: key,
      leading: leading,
      title: title ?? Text(titleText!, style: titleTextStyle),
      subtitle: subtitle,
      trailing: buildTail(),
      isThreeLine: isThreeLine,
      dense: dense,
      visualDensity: visualDensity,
      shape: shape,
      selectedColor: selectedColor,
      iconColor: iconColor,
      textColor: textColor,
      titleTextStyle: titleTextStyle,
      subtitleTextStyle: subtitleTextStyle,
      leadingAndTrailingTextStyle: leadingAndTrailingTextStyle,
      style: style,
      contentPadding: contentPadding,
      enabled: enabled,
      onTap: buildTap(),
      onLongPress: onLongPress,
      onFocusChange: onFocusChange,
      mouseCursor: mouseCursor,
      selected: selected,
      focusColor: focusColor,
      hoverColor: hoverColor,
      splashColor: splashColor,
      focusNode: focusNode,
      autofocus: autofocus,
      tileColor: tileColor,
      selectedTileColor: selectedTileColor,
      enableFeedback: enableFeedback,
      horizontalTitleGap: horizontalTitleGap,
      minVerticalPadding: minVerticalPadding,
      minLeadingWidth: minLeadingWidth,
      minTileHeight: minTileHeight,
      titleAlignment: titleAlignment,
      internalAddSemanticForOnTap: internalAddSemanticForOnTap,
    );
  }

  Widget? buildTail() {
    if (!isLink) return trailing;
    final arrow = Icon(
      IconFont.arrow_right,
      color: AppColors.primary,
      size: 20,
    );

    if (trailing == null) return arrow;
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [trailing!, SizedBox(width: 8), arrow],
    );
  }

  VoidCallback? buildTap() {
    if (onTap != null) return onTap;
    if (to == null) return null;
    return () {
      Get.toNamed(to!);
    };
  }
}
