import 'package:flutter/material.dart';

import '../theme/index.dart';

class Button extends MaterialButton {
  static const LARGE = 56.0;
  static const NORMAL = 48.0;
  static const MEDIUM = 40.0;
  static const SMALL = 32.0;
  static const MINI = 24.0;

  static const danger = AppColors.danger;
  static const warn = AppColors.warn;

  final String? text;
  final bool? filled;
  final bool? outlined;
  final bool? rounded;
  final double? radius;
  final IconData? icon;
  final IconData? rightIcon;
  final double iconMargin;

  const Button({
    super.key,
    required super.onPressed,
    this.radius,
    this.filled,
    super.height = Button.NORMAL,
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
    super.disabledElevation,
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
    super.focusElevation,
    super.hoverElevation,
    super.highlightElevation,
    super.padding,
    super.visualDensity,
    super.shape,
    super.focusNode,
    super.materialTapTargetSize,
    this.icon,
    this.rightIcon,
    this.iconMargin = 4.0,
  }) : assert(!(child == null && text == null), 'child和text不能同时为空');

  const Button.xlarge({
    super.key,
    required super.onPressed,
    this.radius,
    this.filled,
    super.height = Button.LARGE,
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
    super.disabledElevation,
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
    super.focusElevation,
    super.hoverElevation,
    super.highlightElevation,
    super.padding,
    super.visualDensity,
    super.shape,
    super.focusNode,
    super.materialTapTargetSize,
    this.icon,
    this.rightIcon,
    this.iconMargin = 4.0,
  });

  const Button.large({
    super.key,
    required super.onPressed,
    this.radius,
    this.filled,
    super.height = Button.NORMAL,
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
    super.disabledElevation,
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
    super.focusElevation,
    super.hoverElevation,
    super.highlightElevation,
    super.padding,
    super.visualDensity,
    super.shape,
    super.focusNode,
    super.materialTapTargetSize,
    this.icon,
    this.rightIcon,
    this.iconMargin = 4.0,
  });

  const Button.small({
    super.key,
    required super.onPressed,
    this.radius,
    this.filled,
    super.height = Button.SMALL,
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
    super.disabledElevation,
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
    super.focusElevation,
    super.hoverElevation,
    super.highlightElevation,
    super.padding,
    super.visualDensity,
    super.shape,
    super.focusNode,
    super.materialTapTargetSize,
    this.icon,
    this.rightIcon,
    this.iconMargin = 4.0,
  });

  const Button.mini({
    super.key,
    required super.onPressed,
    this.radius,
    this.filled,
    super.height = Button.MINI,
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
    super.disabledElevation,
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
    super.focusElevation,
    super.hoverElevation,
    super.highlightElevation,
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
      highlightElevation: highlightElevation,
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
    final textWidget = Text(text!, style: TextStyle(fontSize: (height ?? MEDIUM) / 3.5));
    if (icon == null && rightIcon == null) return textWidget;
    final iconSize = (height ?? MEDIUM) / 3;
    return Wrap(
      spacing: iconMargin,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        if (icon != null) Icon(icon, size: iconSize),
        textWidget,
        if (rightIcon != null) Icon(rightIcon, size: iconSize),
      ],
    );
  }

  Color computeColor() {
    if (color == null || color == Colors.white || color == Colors.transparent) return textColor ?? AppColors.primary;

    return textColor ?? Colors.white;
  }

  computeBorder() {
    // if (outlined != true) return null;

    final side = filled == false ? const BorderSide(color: danger) : BorderSide.none;

    if (rounded == true) return StadiumBorder(side: side);
    return RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius ?? ((height ?? MEDIUM) / 8)), side: side);
  }
}
