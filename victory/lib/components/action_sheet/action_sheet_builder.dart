import 'package:flutter/material.dart';

import '../../theme/theme.dart';
import '../button/button.dart';
import 'action_sheet.dart';

class HistoryActionSheet<T> extends StatelessWidget {
  final String title;
  final T initValue;
  void Function(T)? onChanged;
  final Iterable<VicAction<T>> actions;
  HistoryActionSheet({super.key, required this.title, required this.onChanged, required this.actions, required this.initValue});

  @override
  Widget build(BuildContext context) {
    return VicButton(
      outlined: true,
      rounded: true,
      fontSize: 12,
      color: AppColors.label,
      backgroundColor: Colors.transparent,
      text: title,
      onPressed: () {
        showVicActionSheet(
          VicActionSheet.single(
            initValue: initValue,
            actions: actions,
            onChanged: onChanged,
          ),
        );
      },
    );
  }
}
