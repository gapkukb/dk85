import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/constants/regexp.dart';
import '../../components/input_base/input_base.dart';

class VicEmailInput extends VicBaseInput {
  final bool optional;

  VicEmailInput({super.key, super.onSaved, this.optional = false, super.backgroundColor})
    : super(
        placeholder: "form.email.placed".tr,
        validator: (value) {
          if (value == null || value.isEmpty) {
            if (optional) return null;
            return "form.required".tr;
          }

          if (!REGEXP_email.hasMatch(value)) return "form.email.error".tr;
          return null;
        },
      );
}
