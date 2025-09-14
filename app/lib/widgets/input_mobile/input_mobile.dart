import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '/constants/regexp.dart';
import '/iconfont/index.dart';
import '/theme/index.dart';
import '../input_base/input_base.dart';

class AKMobileInput extends StatefulWidget {
  final bool changeable;
  final Color? backgroundColor;
  final FormFieldSetter<String>? onSaved;
  const AKMobileInput({super.key, this.onSaved, this.changeable = false, this.backgroundColor});

  @override
  _AKMobileInputState createState() => _AKMobileInputState();
}

class _AKMobileInputState extends State<AKMobileInput> {
  final areaCode = Rx<String?>('95');

  @override
  Widget build(BuildContext context) {
    return AKBaseInput(
      placeholder: "form.tel.placed".tr,
      backgroundColor: widget.backgroundColor,
      prefixIconName: IconFont.mobile,
      prefix: GestureDetector(onTap: widget.changeable ? showPicker : null, child: buildAreaCode(widget.changeable)),
      onSaved: (newValue) {
        widget.onSaved?.call("${areaCode.value}$newValue");
      },
      maxLength: 12,
      keyboardType: TextInputType.phone,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      validator: (value) {
        if (value == null || value.isEmpty) return "form.tel.required".tr;
        if (!REGEXP_MOBILE_NUMBER.hasMatch(value)) return "form.tel.error".tr;
        return null;
      },
    );
  }

  showPicker() async {}

  Widget buildAreaCode(bool changeable) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 4,
      mainAxisSize: MainAxisSize.min,
      children: [
        Obx(() => Text('+${areaCode.value}', style: const TextStyle(color: AppColors.title))),
        if (changeable) const Icon(IconFont.arrow_down_ios, size: 10, color: AppColors.label),
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
