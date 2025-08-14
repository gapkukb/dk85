part of 'index.dart';

const double _kNotchedLeadingSize = 30.0;
const double _kNotchedLeadingToTitle = 12.0;
const TextStyle _kTitleStyle = TextStyle(fontSize: 14);
const TextStyle _kAddtionalStyle = TextStyle(fontSize: 14, color: AppColors.label);

class AkTile extends ListTile {
  final String? titleText;
  final String? trailingText;
  final TextStyle? trailingTextStyle;
  final Color? backgroundColor;
  final Color? backgroundColorActivated;
  final EdgeInsetsGeometry? padding;
  final double leadingSize;
  final double leadingToTitle;
  final bool showArrow;
  final String? to;

  const AkTile({
    super.key,
    super.title,
    super.subtitle,
    super.leading,
    super.trailing,
    super.autofocus,
    super.contentPadding,
    super.dense,
    super.enableFeedback,
    super.enabled,
    super.focusColor,
    super.focusNode,
    super.horizontalTitleGap,
    super.hoverColor,
    super.iconColor,
    super.internalAddSemanticForOnTap,
    super.isThreeLine,
    super.leadingAndTrailingTextStyle,
    super.minLeadingWidth,
    super.minTileHeight,
    super.minVerticalPadding,
    super.mouseCursor,
    super.onFocusChange,
    super.onLongPress,
    super.onTap,
    super.selected,
    super.selectedColor,
    super.selectedTileColor,
    super.shape,
    super.splashColor,
    super.style,
    super.subtitleTextStyle,
    super.textColor,
    super.tileColor,
    super.titleAlignment,
    super.titleTextStyle,
    super.visualDensity,
    this.titleText,
    this.trailingTextStyle,
    this.trailingText,
    this.backgroundColor = Colors.white,
    this.backgroundColorActivated,
    this.padding,
    this.showArrow = false,
    this.leadingSize = _kNotchedLeadingSize,
    this.leadingToTitle = _kNotchedLeadingToTitle,
    this.to,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: buildTitle(),
      key: key,
      leading: leading,
      subtitle: subtitle,
      trailing: buildTail(),
      autofocus: autofocus,
      contentPadding: contentPadding,
      dense: dense,
      enableFeedback: enableFeedback,
      enabled: enabled,
      focusColor: focusColor,
      focusNode: focusNode,
      horizontalTitleGap: horizontalTitleGap,
      hoverColor: hoverColor,
      iconColor: iconColor,
      internalAddSemanticForOnTap: internalAddSemanticForOnTap,
      isThreeLine: isThreeLine,
      leadingAndTrailingTextStyle: leadingAndTrailingTextStyle,
      minLeadingWidth: minLeadingWidth,
      minTileHeight: minTileHeight,
      minVerticalPadding: minVerticalPadding,
      mouseCursor: mouseCursor,
      onFocusChange: onFocusChange,
      onLongPress: onLongPress,
      selected: selected,
      selectedColor: selectedColor,
      selectedTileColor: selectedTileColor,
      shape: shape,
      splashColor: splashColor,
      style: style,
      subtitleTextStyle: subtitleTextStyle,
      textColor: textColor,
      tileColor: tileColor,
      titleAlignment: titleAlignment,
      titleTextStyle: titleTextStyle,
      onTap: () {
        onTap?.call();
        if (to != null) {
          Get.toNamed(to!);
        }
      },
    );
  }

  buildTitle() {
    if (title != null) return title;
    return Text(titleText ?? '');
  }

  Widget? buildTail() {
    final addtional = buildAdditional();
    final arrow = buildArrow();

    if (addtional != null && arrow != null) {
      return Row(mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.center, spacing: 4, children: [addtional, arrow]);
    }

    return addtional ?? arrow;
  }

  Widget? buildAdditional() {
    if (trailing != null) return trailing;
    if (trailingText == null) return null;
    return Text(trailingText!, style: _kAddtionalStyle.merge(trailingTextStyle));
  }

  Widget? buildArrow() {
    if (!showArrow) return null;
    return const Icon(IconFont.a_jiantoushoubingjiantou, size: 20, color: AppColors.primary);
  }
}
