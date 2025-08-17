import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/regexp.dart';
import '../../i18n/index.dart';
import '../../iconfont/index.dart';
import '../../theme/index.dart';
import '../actionsheet/index.dart';
import '../checkbox_list/index.dart';
import '../input_base/input_base.dart';

class AKMobileInput extends StatefulWidget {
  final bool changeable;
  final FormFieldSetter<String>? onSaved;
  const AKMobileInput({super.key, this.onSaved, this.changeable = false});

  @override
  _AKMobileInputState createState() => _AKMobileInputState();
}

class _AKMobileInputState extends State<AKMobileInput> {
  final areaCode = Rx<String?>(null);

  @override
  Widget build(BuildContext context) {
    return AKBaseInput(
      placeholder: "form.tel.placed".tr,
      prefixIconName: IconFont.mobile,
      prefix: GestureDetector(onTap: widget.changeable ? showPicker : showPicker, child: buildAreaCode()),
      onSaved: widget.onSaved,
      maxLength: 11,
      validator: (value) {
        if (value == null || value.isEmpty) return "form.tel.required".tr;
        if (!REGEXP_MOBILE_NUMBER.hasMatch(value)) return "form.tel.error".tr;
        return null;
      },
    );
  }

  showPicker() async {
    areaCode.value = await Get.bottomSheet<String>(
      AKActionsheet(
        AkCheckboxList(
          initialValue: I18n.defaultLocale.areaCode,
          actions: I18n.supported.map((item) => AkCheckboxListItem(item.areaCode, item.areaCode)).toList(),
          onChanged: (value) {
            if (value.isEmpty) return;
            Get.back(result: value);
          },
        ),
      ),
    );
  }

  Widget buildAreaCode() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 4,
      mainAxisSize: MainAxisSize.min,
      children: [
        Obx(() => Text(areaCode.value ?? '', style: const TextStyle(color: AppColors.label))),
        const Icon(IconFont.arrow_down_ios, size: 10, color: AppColors.label),
        const DecoratedBox(
          decoration: BoxDecoration(
            border: Border(right: BorderSide(color: AppColors.label)),
          ),
          child: SizedBox(width: 4, height: 16),
        ),
        const SizedBox(width: 4),
      ],
    );
  }
}
