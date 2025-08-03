part of 'index.dart';

void showLocalePicker() async {
  final code = await Get.bottomSheet(_Picker(storage.locale.value));
  if (code == null) return;
  i18n.updateLocale(code);
}

class _Picker extends StatefulWidget {
  final String initValue;
  const _Picker(this.initValue);

  @override
  State<_Picker> createState() => __PickerState();
}

class __PickerState extends State<_Picker> {
  @override
  Widget build(BuildContext context) {
    return AkActionsheet(
      AkCheckboxList(
        initialValue: widget.initValue,
        actions: I18n.supported.map((item) {
          return AkCheckboxListItem(item.localeName, item.code);
        }).toList(),
        onChanged: (value) {
          Get.back(result: value);
        },
      ),
    );
  }
}
