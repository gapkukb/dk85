import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/constants/regexp.dart';
import '../input_base/input_base.dart';

class AKEmailInput extends AKBaseInput {
  final bool optional;

  AKEmailInput({super.key, super.onSaved, this.optional = false, super.backgroundColor})
    : super(
        placeholder: "Your email address".tr,
        validator: (value) {
          if (value == null || value.isEmpty) {
            if (optional) return null;

            return "form.email.placed".tr;
          }

          if (!REGEXP_email.hasMatch(value)) return "form.email.error".tr;
          return null;
        },
      );
}
