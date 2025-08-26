part of 'index.dart';

class _BodyOptions<T> {
  final String? title;
  final String? cancelText;
  final String? confirmText;
  final bool? showConfirm;
  final bool? showCancel;
  final TextStyle? cancelTextStyle;
  final TextStyle? conformTextStyle;

  _BodyOptions({
    this.cancelText,
    this.confirmText,
    this.showConfirm,
    this.showCancel,
    this.cancelTextStyle,
    this.conformTextStyle,
    this.title,
  });
}

class ChooserOptions<T> extends _BodyOptions<T> {
  final List<Choose<T>>? items;
  final List<Map<String, dynamic>>? options;
  final Widget? prefix;
  final String? prefixText;
  final String? titleKey;
  final String? valueKey;
  final Decoration? decoration;
  final double? width;
  final double? height;
  final EdgeInsets? padding;
  final TextStyle? style;

  ChooserOptions({
    super.cancelText,
    super.confirmText,
    super.showConfirm,
    super.showCancel,
    super.cancelTextStyle,
    super.conformTextStyle,
    this.decoration,
    this.width,
    this.height,
    this.padding,
    this.style,
    this.items,
    this.options,
    super.title,
    this.titleKey,
    this.valueKey,
    this.prefix,
    this.prefixText,
  });
}
