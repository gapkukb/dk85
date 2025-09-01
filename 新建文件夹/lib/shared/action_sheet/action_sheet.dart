import 'package:app/iconfont/index.dart';
import 'package:app/theme/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

part 'action_sheet_wrapper.dart';
part 'action_sheet_action.dart';

extension ExtensionActionSheet on GetInterface {
  Future<T?> showActionSheet<T>({
    required Iterable<ActionSheetAction> actions,
    String initValue = '',
    Color? backgroundColor,
    double? elevation,
    bool persistent = false,
    ShapeBorder? shape,
    Clip? clipBehavior,
    Color? barrierColor,
    bool? ignoreSafeArea,
    bool isScrollControlled = false,
    bool useRootNavigator = false,
    bool isDismissible = true,
    bool enableDrag = true,
    RouteSettings? settings,
    Duration? enterBottomSheetDuration,
    Duration? exitBottomSheetDuration,
    bool closeOnTap = true,
    Function(String value, ActionSheetAction action)? onChange,
  }) {
    return bottomSheet<T>(
      ActionSheetWrapper(
        actions: actions,
        initValue: initValue,
        closeOnTap: closeOnTap,
        onChange: onChange,
      ),
      backgroundColor: backgroundColor,
      elevation: elevation,
      persistent: persistent,
      shape: shape ?? LinearBorder(),
      clipBehavior: clipBehavior,
      barrierColor: barrierColor,
      ignoreSafeArea: ignoreSafeArea,
      isScrollControlled: isScrollControlled,
      useRootNavigator: useRootNavigator,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      settings: settings,
      enterBottomSheetDuration: enterBottomSheetDuration,
      exitBottomSheetDuration: exitBottomSheetDuration,
    );
  }
}
