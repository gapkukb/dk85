import 'package:flutter/material.dart';

import '../checkbox/index.dart';

class AkCheckboxListTile<T> extends StatelessWidget {
  const AkCheckboxListTile({super.key, required this.value, required this.groupValue, required this.onChanged, this.titleText, this.title}) : assert(titleText != null || title != null);

  final T value;
  final T? groupValue;
  final ValueChanged<T>? onChanged;
  final String? titleText;
  final Widget? title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minTileHeight: 48,
      title: title ?? (titleText == null ? null : Text(titleText!)),
      trailing: AKCheckbox(value: value, groupValue: groupValue, onChanged: null),
      onTap: () {
        onChanged?.call(value);
      },
    );
  }
}
