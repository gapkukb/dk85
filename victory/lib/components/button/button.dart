import 'package:flutter/material.dart';
import '../../theme/colors.dart';

abstract class VicButtonHeight {
  static const mini = 24.0;
  static const small = 32.0;
  static const normal = 40.0;
  static const medium = 48.0;
  static const large = 56.0;
}

abstract class VicButtonGradientDirection {
  /// 从左到右
  static const leftToRight = (Alignment(-1, 0), Alignment(1, 0));

  /// 从右到左
  static const rightToLeft = (Alignment(1, 0), Alignment(-1, 0));

  /// 从上到下
  static const topToBottom = (Alignment(0, -1), Alignment(0, 1));

  /// 从下到上
  static const bottomToTop = (Alignment(0, 1), Alignment(0, -1));

  /// 从左上到右下
  static const leftTopToRightBottom = (Alignment(-1, -1), Alignment(1, 1));

  /// 从右下到左上
  static const righBottomtToLeftTop = (Alignment(1, 1), Alignment(-1, -1));

  /// 从左下到右上
  static const leftBottomToRightTop = (Alignment(-1, 1), Alignment(1, -1));

  /// 从右上到左下
  static const rightTopToLeftBottom = (Alignment(1, -1), Alignment(-1, 1));
}

enum VicButtonDisabledStyle { grayscale, opacity }

enum VicButtonGradientType { linear, radial }

class VicButton extends StatelessWidget {
  static Color? defaultColor;
  static Color? defaultBackgroundColor;
  static double defaultHeight = VicButtonHeight.normal;
  static double defaultBorderRadius = 4.0;
  static double? defaultFontSize;
  static double defaultSpacing = 4.0;
  static bool? defaultRounded;
  static bool? defaultOutlined;
  static double? defaultPadding;

  final bool disabled;
  final VicButtonDisabledStyle disabledStyle;
  final bool? rounded;
  final bool? outlined;
  final bool fullWidth;
  final double? width;
  final double? height;
  final double? size;
  final double? minWidth;
  final double? borderRadius;
  final double? padding;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final Color? backgroundColor;
  final Color? color;
  final BoxDecoration? decoration;
  final List<Color>? gradientColors;
  final Gradient? gradient;
  final VicButtonGradientType? gradientType;

  /// 仅对 VicButtonGradientType.radial生效
  final double? gradientRadius;
  final (AlignmentGeometry, AlignmentGeometry) gradientDirection;
  final IconData? iconData;
  final IconData? iconRightData;
  final Widget? icon;
  final Widget? iconRight;
  final double? iconSize;
  final Color? iconColor;
  final IconThemeData? iconTheme;
  final String? text;
  final TextStyle? textStyle;
  final double? fontSize;
  final bool textBold;
  final double? spacing;
  final Widget? child;
  final Axis direction;
  final DecorationImage? image;

  const VicButton({
    super.key,
    this.disabled = false,
    this.disabledStyle = VicButtonDisabledStyle.opacity,
    this.rounded,
    this.outlined,
    this.fullWidth = false,
    this.width,
    this.size,
    this.height,
    this.minWidth,
    this.borderRadius,
    this.padding,
    this.onPressed,
    this.backgroundColor,
    this.gradient,
    this.iconData,
    this.iconRightData,
    this.icon,
    this.iconRight,
    this.text,
    this.child,
    this.textStyle,
    this.color,
    this.spacing = 4.0,
    this.direction = Axis.horizontal,
    this.fontSize,
    this.textBold = false,
    this.iconColor,
    this.iconSize,
    this.iconTheme,
    this.image,
    this.decoration,
    this.onLongPress,
    this.gradientRadius,
    this.gradientType,
    this.gradientDirection = VicButtonGradientDirection.topToBottom,
    this.gradientColors = const [AppColors.primary, AppColors.highlight],
  });

  double get _height => height ?? size ?? defaultHeight;
  double get _borderRadius => borderRadius ?? defaultBorderRadius;
  bool get _outlined => outlined ?? defaultOutlined ?? false;
  bool get _rounded => rounded ?? defaultRounded ?? false;

  @override
  Widget build(BuildContext context) {
    final gradient = computeGradient();
    final background = computeBackground(gradient);
    final foreground = computeForeground(context, background);

    final widget = RawMaterialButton(
      enableFeedback: false,
      onPressed: disabled ? null : onPressed,
      onLongPress: disabled ? null : onLongPress,
      elevation: 0,
      focusElevation: 0,
      highlightElevation: 0,
      disabledElevation: 0,
      hoverElevation: 0,
      textStyle: textStyle,
      fillColor: background,
      padding: EdgeInsetsGeometry.symmetric(horizontal: padding ?? defaultPadding ?? (width == null ? _height / 2 : 0)),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      constraints: BoxConstraints(
        minWidth: fullWidth ? double.infinity : minWidth ?? width ?? size ?? 0,
        maxWidth: fullWidth ? double.infinity : width ?? size ?? double.infinity,
        minHeight: _height,
        maxHeight: _height,
      ),
      shape: _shape,
      child: computeChild(foreground),
    );

    if (decoration == null && gradient == null && image == null) return widget;

    return DecoratedBox(
      decoration:
          decoration ?? BoxDecoration(gradient: gradient, borderRadius: BorderRadius.circular(_rounded ? _height : _borderRadius), image: image),
      child: widget,
    );
  }

  Widget computeChild(Color? foreground) {
    final _color = iconColor ?? color ?? defaultColor;
    final _size = iconSize ?? _height / 1.4;

    final List<Widget> children = [
      if (icon != null) icon!,
      if (iconData != null)
        Icon(
          iconData,
          color: _color,
          size: _size,
        ),
      if (child != null) child!,
      if (text != null)
        Text(
          text!,
          style: TextStyle(
            fontSize: fontSize ?? _height / 3,
            color: foreground,
            height: 1,
            fontWeight: textBold ? FontWeight.bold : null,
          ).merge(textStyle),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),

      if (iconRight != null) iconRight!,
      if (iconRightData != null)
        Icon(
          iconRightData,
          color: _color,
          size: _size,
        ),
    ];

    if (children.length == 1) return children.first;
    final wrap = Wrap(
      direction: direction,
      spacing: spacing ?? defaultSpacing,
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      runSpacing: spacing ?? defaultSpacing,
      runAlignment: WrapAlignment.center,
      children: children,
    );

    if (icon == null && iconData == null && iconRight == null && iconRightData == null) return wrap;

    final iconTheme = computeIconTheme(foreground);
    return wrap;
  }

  // 计算边框
  ShapeBorder get _shape {
    BorderSide border = BorderSide.none;
    if (_outlined) {
      border = BorderSide(color: color ?? Colors.transparent, width: 1);
    }
    if (_rounded) return StadiumBorder(side: border);
    return RoundedRectangleBorder(borderRadius: BorderRadius.circular(_borderRadius), side: border);
  }

  // 计算背景色
  Color? computeBackground(Gradient? gradient) {
    if (_outlined || gradient != null) return null;
    if (backgroundColor != null && disabled) {
      if (disabledStyle == VicButtonDisabledStyle.grayscale) return _toGray(backgroundColor!);
      return backgroundColor!.withAlpha(154);
    }
    return backgroundColor;
  }

  // 计算前景色
  Color? computeForeground(BuildContext context, Color? background) {
    if (color != null) return color;
    if (background == Colors.white) return Colors.black;
    // if (background == null || background == Colors.transparent) {
    //   final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    //   final themeTextCOlor = Theme.of(context).textTheme.bodyMedium?.color;
    //   final textColor = themeTextCOlor ?? (isDarkMode ? Colors.white : Colors.black);
    //   return textColor;
    // }
    return Colors.white;
  }

  // 计算图标主题
  IconThemeData computeIconTheme(Color? foreground) {
    return IconThemeData(size: iconSize ?? fontSize ?? _height / 2.5, color: iconColor ?? foreground).merge(iconTheme);
  }

  Color _toGray(Color color) {
    HSLColor hslColor = HSLColor.fromColor(color);
    HSLColor grayHsl = hslColor.withSaturation(0); // 设置饱和度为0
    return grayHsl.toColor();
  }

  Gradient? computeGradient() {
    if (backgroundColor != null) return null;
    if (gradient != null) return gradient;
    if (gradientColors == null) return null;
    if (gradientType == VicButtonGradientType.radial) return RadialGradient(colors: gradientColors!, radius: gradientRadius ?? 1.0);
    return LinearGradient(colors: gradientColors!, begin: gradientDirection.$1, end: gradientDirection.$2);
  }
}
