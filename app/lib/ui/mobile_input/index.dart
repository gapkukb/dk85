import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/regexp.dart';
import '../../i18n/index.dart';
import '../../theme/index.dart';
import '../actionsheet/index.dart';
import '../checkbox_list/index.dart';
import '../fields/base_field.dart';

class MobileInput extends StatefulWidget {
  final bool changeable;
  final FormFieldSetter<String>? onSaved;
  const MobileInput({super.key, this.onSaved, this.changeable = false});

  @override
  _MobileInputState createState() => _MobileInputState();
}

class _MobileInputState extends State<MobileInput> {
  @override
  Widget build(BuildContext context) {
    return BaseInput(
      placeholder: "您的手机号码",
      prefix: GestureDetector(
        onTap: widget.changeable ? showPicker : null,
        child: Container(
          margin: const EdgeInsets.only(right: 8),
          padding: const EdgeInsets.only(left: 8, right: 8),
          decoration: const BoxDecoration(
            border: Border(right: BorderSide(color: AppColors.description)),
          ),
          child: const Text("+95"),
        ),
      ),
      contentPadding: const EdgeInsets.only(left: 0),
      onSaved: widget.onSaved,
      maxLength: 11,
      validator: (value) {
        if (value == null || value.isEmpty) return "请填写您的手机号码";
        if (!REGEXP_MOBILE_NUMBER.hasMatch(value)) return "您的手机号码填写有误";
        return null;
      },
    );
  }

  showPicker() {
    Get.bottomSheet(
      AkActionsheet(
        AkCheckboxList(
          initialValue: I18n.defaultLocale.areaCode,
          actions: I18n.supported.map((item) => AkCheckboxListItem(item.areaCode, item.areaCode)).toList(),
          onChanged: (value) {
            Get.back(result: value);
          },
        ),
      ),
    );
  }
}
