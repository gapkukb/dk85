import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../components/input_base/input_base.dart';
import '../../iconfont/iconfont.dart';

class VicAccInput extends StatefulWidget {
  final bool changeable;
  final FormFieldSetter<String>? onSaved;
  const VicAccInput({super.key, this.onSaved, this.changeable = false});

  @override
  _VicAccInputState createState() => _VicAccInputState();
}

class _VicAccInputState extends State<VicAccInput> {
  @override
  Widget build(BuildContext context) {
    return AKBaseInput(
      placeholder: "form.acc.placed".tr,
      prefixIconName: IconFont.user,
      onSaved: widget.onSaved,
      validator: (value) {
        if (value == null || value.isEmpty) return "form.acc.placed".tr;
        // if (!REGEXP_ACCOUNT.hasMatch(value)) return "form.acc.error".tr;
        return null;
      },
    );
  }
}
