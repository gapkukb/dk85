import 'package:flutter/material.dart';
import 'package:victory/components/action_sheet/action_sheet.dart';
import 'package:victory/components/button/button.dart';
import 'package:victory/components/svg_view/svg_view.dart';
import 'package:victory/services/services.dart';
import 'package:victory/theme/theme.dart';

class LocalePicker extends StatelessWidget {
  final Widget? child;
  final double size;
  final double iconSize;
  final Color? color;
  const LocalePicker({super.key, this.child, this.size = 36, this.iconSize = 24, this.color});

  @override
  Widget build(BuildContext context) {
    if (child != null) {
      return GestureDetector(
        onTap: _showPicker,
        child: child,
      );
    }
    return VicButton(
      backgroundColor: AppColors.white,
      rounded: true,
      size: size,
      padding: 0,
      icon: SvgView(
        name: 'translator.svg',
        size: iconSize,
      ),
      onPressed: _showPicker,
    );
  }

  void _showPicker() {
    final actions = services.app.supportedLocales.map(
      (e) => VicAction(title: e.localeName, value: e.languageCode),
    );
    showVicActionSheet(
      VicActionSheet.single(
        initValue: services.app.currentLocaleCode,
        actions: actions,
        onChanged: services.app.updateLocaleByCode,
      ),
    );
  }
}
