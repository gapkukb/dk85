import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../iconfont/iconfont.dart';
import '/constants/regexp.dart';
import '../../components/input_base/input_base.dart';

class VicPwdInput extends StatefulWidget {
  const VicPwdInput({
    super.key,
    this.reference,
    this.onSaved,
    this.placeholder,
    this.controller,
    this.backgroundColor,
  });

  final TextEditingController? controller;
  final TextEditingController? reference;
  final FormFieldSetter<String>? onSaved;
  final String? placeholder;
  final Color? backgroundColor;

  @override
  State<VicPwdInput> createState() => _VicPwdInputState();
}

class _VicPwdInputState extends State<VicPwdInput> {
  var obscureText = true;

  @override
  Widget build(BuildContext context) {
    return VicBaseInput(
      backgroundColor: widget.backgroundColor,
      obscureText: obscureText,
      placeholder: widget.placeholder ?? (widget.reference == null ? "form.pwd.placed".tr : "form.repwd.placed".tr),
      onSaved: widget.onSaved,
      prefixIconName: IconFont.mima,
      maxLength: 20,
      suffixIconConstraints: const BoxConstraints(minWidth: 56),
      controller: widget.controller,
      suffixIcon: GestureDetector(
        onTap: () {
          setState(() {
            obscureText = !obscureText;
          });
        },
        child: Icon(
          obscureText ? IconFont.eye_opened : IconFont.eye_closed,
          size: 24,
        ),
      ),
      validator: widget.reference == null ? validate : validateRepeat,
    );
  }

  String? validate(String? value) {
    if (value == null || value.isEmpty) return "form.pwd.placed".tr;
    if (!REGEXP_PASSWORD.hasMatch(value)) return "form.pwd.error".tr;
    return null;
  }

  String? validateRepeat(String? value) {
    if (value == null || value.isEmpty) return "form.repwd.placed".tr;
    if (widget.reference!.text == value) return null;
    return "form.repwd.error".tr;
  }
}
