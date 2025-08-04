import 'package:flutter/widgets.dart';

import '/constants/regexp.dart';
import '/iconfont/index.dart';
import 'base_field.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({super.key, this.reference, this.onSaved, this.placeholder, this.controller});

  final TextEditingController? controller;
  final TextEditingController? reference;
  final FormFieldSetter<String>? onSaved;
  final String? placeholder;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  var obscureText = true;

  @override
  Widget build(BuildContext context) {
    return BaseInput(
      obscureText: obscureText,
      placeholder: widget.placeholder,
      onSaved: widget.onSaved,
      prefixIconName: IconFont.mima,
      maxLength: 20,
      suffixIcon: GestureDetector(
        onTap: () {
          setState(() {
            obscureText = !obscureText;
          });
        },
        child: Icon(obscureText ? IconFont.eye_opened : IconFont.eye_closed),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) return "请填写密码";
        if (!REGEXP_PASSWORD.hasMatch(value)) return "密码必须是6-20位数字";
        if (widget.reference == null || widget.reference!.text == value) return null;
        return "两次密码不一致";
      },
    );
  }
}
