import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../theme/index.dart';

class AkTile extends StatelessWidget {
  static const textStyle = TextStyle(fontSize: 14);
  static const valueStyle = TextStyle(fontSize: 14, color: AppColors.description);
  static const arrowIcon = Icon(Symbols.arrow_forward_ios, size: 16, color: AppColors.description);
  static const padding = EdgeInsets.only(left: 16, top: 0, bottom: 0, right: 8);

  final String? titleText;
  final Widget? title;
  final String? valueText;
  final Widget? value;
  final Widget? leading;
  final bool isLink;
  final VoidCallback? onTap;
  final String? to;
  final String? arrowDirection;
  final double arrowMargin;
  const AkTile({super.key, this.titleText, this.title, this.valueText, this.value, this.leading, this.isLink = false, this.onTap, this.to, this.arrowDirection, this.arrowMargin = 4.0});

  @override
  Widget build(BuildContext context) {
    final handler =
        onTap ??
        (to == null
            ? null
            : () {
                Navigator.pushNamed(context, to!);
              });

    return ListTile(
      minTileHeight: 44,
      leading: leading,
      leadingAndTrailingTextStyle: valueStyle,
      title: title ?? (titleText == null ? null : Text(titleText!, style: textStyle)),
      trailing: buildTrailing(),
      onTap: handler,
      contentPadding: isLink ? padding : padding.copyWith(right: 16),
    );
  }

  buildArrow() {
    return isLink ? arrowIcon : null;
  }

  buildAddition() {
    if (value == null && valueText == null) return;

    return value ?? Text(valueText!, style: valueStyle);
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
}
