import 'package:app/shared/action_sheet/action_sheet.dart';
import 'package:app/shared/chooser/index.dart';
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

  const LocaleSelector({super.key, this.child, this.color, this.size = 24, this.decoration, this.builder, this.iconSize = 24});

  @override
  Widget build(BuildContext context) {
    final options = I18n.supported.map((locale) => Choose(title: locale.localeName, value: locale.languageCode)).toList();
    return Chooser<String>(
      initValue: storage.locale.value,
      builder: (context, title, value) {
        return Container(
          alignment: Alignment.center,
          decoration: decoration,
          width: size,
          height: size,
          child: VectorGraphic(loader: AssetBytesLoader("assets/svg/translator.svg"), width: iconSize, height: iconSize),
        );
      },
      options: ChooserOptions(items: options),
      onChanged: (value, current) {
        i18n.updateLocale(value);
      },
    );
  }
}
