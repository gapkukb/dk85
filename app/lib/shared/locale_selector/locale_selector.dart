import 'package:app/shared/action_sheet/action_sheet.dart';
import 'package:app/storage/storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vector_graphics/vector_graphics.dart';
import 'package:app/i18n/index.dart';

class LocaleSelector extends StatelessWidget {
  final BoxDecoration? decoration;
  final Widget? child;
  final double size;
  final double iconSize;
  final Color? color;
  final Function(BuildContext context, Widget child)? builder;

  const LocaleSelector({
    super.key,
    this.child,
    this.color,
    this.size = 24,
    this.decoration,
    this.builder,
    this.iconSize = 24,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: showPicker, child: compute(context));
  }

  static void showPicker() {
    Get.showActionSheet(
      initValue: storage.locale.value,
      actions: I18n.supported
          .map(
            (locale) =>
                ActionSheetAction(title: locale.localeName, value: locale.code),
          )
          .toList(),
      onChange: (value) {
        i18n.updateLocale(value);
      },
    );
  }

  Widget compute(BuildContext context) {
    if (child != null) return AbsorbPointer(child: child);
    final icon = Container(
      alignment: Alignment.center,
      decoration: decoration,
      width: size,
      height: size,
      child: VectorGraphic(
        loader: AssetBytesLoader("assets/svg/translator.svg"),
        width: iconSize,
        height: iconSize,
      ),
    );
    if (builder != null) return builder!(context, icon);
    return icon;
  }
}
