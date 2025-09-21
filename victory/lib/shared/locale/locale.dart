import 'package:flutter/material.dart';
import '../../components/action_sheet/action_sheet.dart';
import '../../components/button/button.dart';
import '../../components/svg_view/svg_view.dart';
import '../../stores/stores.dart';
import '../../styles/styles.dart';

class LocalePicker extends StatelessWidget {
  const LocalePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VicButton(
      backgroundColor: AppColor.white,
      rounded: true,
      size: 36,
      padding: 0,
      icon: const SvgView(name: 'translator.svg'),
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
