import 'package:flutter/material.dart';
import '../../components/action_sheet/action_sheet.dart';
import '../../components/button/button.dart';
import '../../components/svg_view/svg_view.dart';
import '../../stores/stores.dart';
import '../../theme/theme.dart';

class LocalePicker extends StatelessWidget {
  final Widget? child;
  final double size;
  final double iconSize;
  final Color? color;
  const LocalePicker({Key? key, this.child, this.size = 36, this.iconSize = 24, this.color});

  @override
  Widget build(BuildContext context) {
    if (child != null) {
      return GestureDetector(
        child: child,
        onTap: _showPicker,
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
    final actions = stores.app.supportedLocales.map(
      (e) => VicAction(title: e.localeName, value: e.languageCode),
    );
    showVicActionSheet(
      VicActionSheet.single(
        initValue: stores.app.currentLocaleCode,
        actions: actions,
        onChanged: stores.app.updateLocaleByCode,
      ),
    );
  }
}
