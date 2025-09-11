import 'dart:math';

import 'package:flutter/material.dart';

import '/theme/index.dart';

const defaultGradient = [Color(0xffffa575), AppColors.primary];

class AKButton extends MaterialButton {
  /// 56px
  static const LARGE = 56.0;

  /// 48.0px
  static const NORMAL = 48.0;

  /// 40.0px
  static const MEDIUM = 40.0;

  /// 32.0px
  static const SMALL = 32.0;

  /// 24.0px
  static const MINI = 24.0;

  static const danger = AppColors.highlight;
  static const warn = AppColors.ff8240;

  final String? text;
  final bool? filled;
  final bool? outlined;
  final bool? rounded;
  final double radius;
  final IconData? icon;
  final IconData? rightIcon;
  final double iconMargin;
  final List<Color>? gradient;

  const AKButton({
    super.key,
    required super.onPressed,
    this.radius = 8.0,
    this.filled,
    super.height = AKButton.NORMAL,
    super.color = AKButton.danger,
    super.textColor,
    this.text,
    this.outlined,
    this.rounded,
    super.minWidth,
    super.child,
    super.animationDuration,
    super.autofocus,
    super.clipBehavior,
    super.colorBrightness,
    super.disabledColor,
    super.disabledElevation = 0.0,
    super.disabledTextColor,
    super.elevation = 0.0,
    super.enableFeedback,
    super.focusColor,
    super.onLongPress,
    super.onHighlightChanged,
    super.mouseCursor,
    super.textTheme,
    super.hoverColor,
    super.highlightColor,
    super.splashColor,
    super.focusElevation = 0.0,
    super.hoverElevation = 0.0,
    super.highlightElevation = 0.0,
    super.padding,
    super.visualDensity,
    super.shape,
    super.focusNode,
    super.materialTapTargetSize,
    this.icon,
    this.rightIcon,
    this.iconMargin = 4.0,
    this.gradient = defaultGradient,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColor = (filled == false || outlined == true) ? (computeColor() ?? Colors.transparent) : (color ?? Colors.transparent);

    final foregroundColor = (filled == false || outlined == true) ? color : computeColor();

    Widget button = MaterialButton(
      onPressed: onPressed,
      // color: gradient == null ? backgroundColor : null,
      color: outlined == true ? Colors.transparent : backgroundColor,
      textColor: foregroundColor,
      shape: computeBorder(foregroundColor),
      height: height,
      minWidth: minWidth,
      animationDuration: animationDuration,
      autofocus: autofocus,
      clipBehavior: clipBehavior,
      colorBrightness: colorBrightness,
      disabledColor: backgroundColor.withAlpha(128),
      disabledElevation: disabledElevation,
      disabledTextColor: foregroundColor?.withBlue(50),
      elevation: elevation,
      enableFeedback: enableFeedback,
      focusColor: focusColor,
      onLongPress: onLongPress,
      onHighlightChanged: onHighlightChanged,
      mouseCursor: mouseCursor,
      hoverColor: hoverColor,
      highlightColor: highlightColor,
      splashColor: splashColor,
      focusElevation: focusElevation,
      hoverElevation: hoverElevation,
      highlightElevation: 0,
      padding: padding,
      visualDensity: visualDensity,
      focusNode: focusNode,
      materialTapTargetSize: materialTapTargetSize,
      child: computeChild(),
    );

    // if (gradient != null && gradient!.length > 1) {
    //   button = DecoratedBox(
    //     decoration: BoxDecoration(
    //       gradient: LinearGradient(
    //         colors: gradient!,
    //         begin: Alignment.topCenter,
    //         end: Alignment.bottomCenter,
    //       ),
    //       borderRadius: BorderRadius.circular(radius),
    //     ),
    //     child: button,
    //   );
    // }

    if (disabledColor != null || disabledTextColor != null) return button;

    return Opacity(opacity: onPressed == null && onLongPress == null ? 0.8 : 1, child: button);
  }

  computeChild() {
    if (child != null) return child;
    final children = <Widget>[];
    final iconSize = (height ?? MEDIUM) / 3;

    if (icon != null) {
      children.add(Icon(icon, size: iconSize));
    }

    if (text != null) {
      children.add(Text(text!, style: TextStyle(fontSize: max((height ?? MEDIUM) / 3, 12))));
    }

    if (rightIcon != null) {
      children.add(Icon(rightIcon, size: iconSize));
    }

    if (children.length < 2) return children[0];

    return Wrap(spacing: iconMargin, crossAxisAlignment: WrapCrossAlignment.center, children: children);
  }

  Color computeColor() {
    if (color == null || color == Colors.white || color == Colors.transparent) {
      return textColor ?? AppColors.title;
    }

    return textColor ?? Colors.white;
  }

  computeBorder(Color? color) {
    // if (outlined != true) return null;

    final side = (filled == false || outlined == true) ? BorderSide(color: color ?? danger, width: 2) : BorderSide.none;

    if (rounded == true) return StadiumBorder(side: side);
    return RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius), side: side);
  }
}
