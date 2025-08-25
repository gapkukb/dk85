import 'package:app/iconfont/index.dart';
import 'package:app/theme/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

part 'action_sheet_wrapper.dart';
part 'action_sheet_action.dart';

extension ExtensionActionSheet on GetInterface {
  Future<T?> showActionSheet<T>({
    final List<ActionSheetAction<T>>? actions,
    final List<Map<String, T>> options = const [],
    final T? initValue,
    final bool closeOnTap = true,
    final String? labelKey,
    final String? valueKey,
    ValueChanged<T>? onChange,
  }) async {
    final a = actions == null || actions.isEmpty;
    final b = options.isEmpty;

    if (a && b) return null;

    final result = await bottomSheet<List<T>>(
      ActionSheetWrapper(
        actions: actions,
        options: options,
        labelKey: labelKey,
        valueKey: valueKey,
        mutiple: false,
        initValue: [initValue],
        closeOnTap: closeOnTap,
        onChange: (value) {
          onChange?.call(value.first as T);
        },
      ),
    );

    if (result == null) return null;
    return result.first;
  }

  Future<List<T>?> showMutipleActionSheet<T>({
    final List<ActionSheetAction<T>>? actions,
    final List<Map<String, T>> options = const [],
    final List<T> initValue = const [],
    final bool closeOnTap = true,
    final String? titleKey,
    final String? valueKey,
    ValueChanged<List<T>>? onChange,
    void Function(T current, List<T> value)? onSelect,
  }) {
    final a = actions == null || actions.isEmpty;
    final b = options.isEmpty;

    if (a && b) return Future.value(null);

    return bottomSheet<List<T>>(
      ActionSheetWrapper<T>(
        actions: actions,
        options: options,
        labelKey: titleKey,
        valueKey: valueKey,
        mutiple: true,
        initValue: initValue,
        closeOnTap: closeOnTap,
        onChange: onChange,
        onSelect: onSelect,
      ),
    );
  }
}
