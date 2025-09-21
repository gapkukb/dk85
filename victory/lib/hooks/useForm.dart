import 'package:flutter/material.dart';

class Useform {
  final Map<String, dynamic> _values = {};
  final Function(Map<String, dynamic> values) _submit;
  final key = GlobalKey<FormState>();

  Useform(this._submit);

  void Function(dynamic value) saveAs(String name) {
    return (value) {
      _values[name] = value;
    };
  }

  submit([String? value]) {
    FocusManager.instance.primaryFocus?.unfocus();
    if (key.currentState == null) return;
    if (key.currentState!.validate()) {
      key.currentState!.save();
      _submit(_values);
    }
  }
}
