part of 'index.dart';

class AkTileGroup extends StatelessWidget {
  final Widget? header;
  final Widget? footer;
  final EdgeInsets margin;
  final List<Widget>? children;
  final BoxDecoration? decoration;
  final Color backgroundColor;
  final Clip clipBehavior;
  final double dividerMargin;
  final double additionalDividerMargin;
  final double? topMargin;
  final Color? separatorColor;
  final bool hasLeading;
  final bool inset;

  const AkTileGroup({
    super.key,
    this.header,
    this.footer,
    this.margin = const EdgeInsets.all(0),
    this.children,
    this.decoration,
    this.backgroundColor = Colors.transparent,
    this.clipBehavior = Clip.hardEdge,
    this.dividerMargin = 0,
    this.additionalDividerMargin = 0,
    this.topMargin,
    this.separatorColor,
    this.hasLeading = false,
    this.inset = false,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoListSection.insetGrouped(
      backgroundColor: backgroundColor,
      clipBehavior: clipBehavior,
      decoration: decoration,
      footer: footer,
      header: footer,
      key: key,
      separatorColor: separatorColor,
      topMargin: topMargin,
      hasLeading: hasLeading,
      additionalDividerMargin: 0,
      dividerMargin: 0,
      margin: (inset ? const EdgeInsets.all(12) : margin).copyWith(top: topMargin ?? 12),
      children: children,
    );
  }
}
