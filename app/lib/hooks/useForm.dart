import 'package:flutter/cupertino.dart';

class Useform {
  final _values = {};
  final Function(Map values) _submit;
  final key = GlobalKey<FormState>();

  Useform(this._submit);

  saveAs(String name) {
    return (dynamic value) {
      _values[name] = value;
    };
  }

  submit([String? value]) {
    if (key.currentState == null) return;
    if (key.currentState!.validate()) {
      key.currentState!.save();
      _submit(_values);
    }
  }
}
