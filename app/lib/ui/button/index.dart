import 'package:flutter/material.dart';

import '/theme/index.dart';

class AKButton extends MaterialButton {
  static const LARGE = 56.0;
  static const NORMAL = 48.0;
  static const MEDIUM = 40.0;
  static const SMALL = 32.0;
  static const MINI = 24.0;

  static const danger = AppColors.primary;
  static const warn = AppColors.warn;

  final String? text;
  final bool? filled;
  final bool? outlined;
  final bool? rounded;
  final double? radius;
  final IconData? icon;
  final IconData? rightIcon;
  final double iconMargin;

  const AKButton({
    super.key,
    required super.onPressed,
    this.radius,
    this.filled,
    super.height = AKButton.NORMAL,
    super.color,
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
    super.elevation,
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
  });

  const AKButton.xlarge({
    super.key,
    required super.onPressed,
    this.radius,
    this.filled,
    super.height = AKButton.LARGE,
    super.color,
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
    super.elevation,
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
  });

  const AKButton.large({
    super.key,
    required super.onPressed,
    this.radius,
    this.filled,
    super.height = AKButton.NORMAL,
    super.color,
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
    super.elevation,
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
    super.padding,
    super.visualDensity,
    super.shape,
    super.focusNode,
    super.materialTapTargetSize,
    this.icon,
    this.rightIcon,
    this.iconMargin = 4.0,
  });

  const AKButton.small({
    super.key,
    required super.onPressed,
    this.radius,
    this.filled,
    super.height = AKButton.SMALL,
    super.color,
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
    super.elevation,
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
  });

  const AKButton.mini({
    super.key,
    required super.onPressed,
    this.radius,
    this.filled,
    super.height = AKButton.MINI,
    super.color,
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
    super.elevation,
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
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColor = filled == false ? computeColor() : color;
    final foregroundColor = filled == false ? color : computeColor();

    final button = MaterialButton(
      onPressed: onPressed,
      color: backgroundColor,
      textColor: foregroundColor,
      shape: computeBorder(),
      height: height,
      minWidth: minWidth,
      animationDuration: animationDuration,
      autofocus: autofocus,
      clipBehavior: clipBehavior,
      colorBrightness: colorBrightness,
      disabledColor: backgroundColor?.withAlpha(128),
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

    if (rightIcon != null) {
      children.add(Icon(rightIcon, size: iconSize));
    }

    if (text != null) {
      children.add(Text(text!, style: TextStyle(fontSize: (height ?? MEDIUM) / 3.5)));
    }

    if (children.length < 2) return children[0];

    return Wrap(spacing: iconMargin, crossAxisAlignment: WrapCrossAlignment.center, children: children);
  }

  Color computeColor() {
    if (color == null || color == Colors.white || color == Colors.transparent) return textColor ?? AppColors.title;

    return textColor ?? Colors.white;
  }

  computeBorder() {
    // if (outlined != true) return null;

    final side = filled == false ? const BorderSide(color: danger) : BorderSide.none;

    if (rounded == true) return StadiumBorder(side: side);
    return RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius ?? ((height ?? MEDIUM) / 8)), side: side);
  }
}
