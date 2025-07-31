import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import '/theme/index.dart';

class AkCheckbox<T> extends StatelessWidget {
  final T value;
  final T? groupValue;
  final ValueChanged<T>? onChanged;
  final Color activeColor;
  final IconData activeIcon;
  final Color inactiveColor;
  final IconData inactiveIcon;
  final double size;
  final double spacing;
  final String? labelText;
  final Widget? label;
  final bool labelOnRight;
  final bool readonly;

  const AkCheckbox({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.activeIcon = Symbols.task_alt,
    this.inactiveIcon = Symbols.circle,
    this.activeColor = AppColors.danger,
    this.inactiveColor = AppColors.description,
    this.readonly = false,
    this.size = 20.0,
    this.spacing = 4.0,
    this.label,
    this.labelText,
    this.labelOnRight = false,
  });

  @override
  Widget build(BuildContext context) {
    final selected = value == groupValue;
    final icon = Icon(selected ? activeIcon : inactiveIcon, color: selected ? activeColor : inactiveColor, size: size);
    final $label = label ?? (labelText == null ? null : Text(labelText!));

    if ($label == null) return icon;
    final widget = Wrap(crossAxisAlignment: WrapCrossAlignment.center, spacing: spacing, children: [if (!labelOnRight) $label, icon, if (labelOnRight) $label]);
    if (readonly || onChanged == null) return widget;

    return GestureDetector(
      onTap: () {
        onChanged!(value);
      },
      child: widget,
    );
  }
}
