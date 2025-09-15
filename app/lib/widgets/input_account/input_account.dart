import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/regexp.dart';
import '../../iconfont/index.dart';
import '../input_base/input_base.dart';

class AKAccInput extends StatefulWidget {
  final bool changeable;
  final FormFieldSetter<String>? onSaved;
  const AKAccInput({super.key, this.onSaved, this.changeable = false});

  @override
  _AKAccInputState createState() => _AKAccInputState();
}

class _AKAccInputState extends State<AKAccInput> {
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
