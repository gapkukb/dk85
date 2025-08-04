import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../iconfont/index.dart';
import '/theme/index.dart';

class AkPasswordInput extends StatefulWidget {
  final String? placeholder;
  final IconData? icon;
  final Widget? prefix;
  final Widget? suffix;
  final void Function(String? value) onSaved;
  final String? Function(String? value) validator;
  final TextEditingController? controller;
  final bool obscured;
  final bool autofocus;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final int? maxLength;
  final String? initialValue;

  const AkPasswordInput({
    super.key,
    this.placeholder,
    this.icon,
    this.prefix,
    this.suffix,
    this.controller,
    this.obscured = false,
    this.autofocus = false,
    this.keyboardType,
    this.maxLength,
    this.textInputAction,
    this.initialValue,
    required this.onSaved,
    required this.validator,
  });

  @override
  AkPasswordInputState createState() => AkPasswordInputState();
}

class AkPasswordInputState extends State<AkPasswordInput> {
  late final TextEditingController controller;
  late bool obscured;
  var clearable = false;
  final stream = StreamController<bool>();

  @override
  void initState() {
    controller = widget.controller ?? TextEditingController();
    controller.addListener(() {
      if (controller.text.isNotEmpty) {
        clearable = true;
        setState(() {});
      }
    });
    obscured = widget.obscured;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorHeight: 16,
      cursorErrorColor: null,
      style: const TextStyle(fontSize: 16),
      validator: widget.validator,
      keyboardType: widget.keyboardType,
      initialValue: widget.initialValue,
      maxLength: widget.maxLength,
      obscureText: obscured,
      autofocus: widget.autofocus,
      textInputAction: widget.textInputAction,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],

      decoration: InputDecoration(
        counterText: '',
        filled: true,
        fillColor: Colors.white,
        errorBorder: InputBorder.none,
        suffixIconColor: Colors.black,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none),
        ),
        prefixIcon: widget.prefix ?? (widget.icon == null ? null : Icon(widget.icon, size: 16)),
        suffix: Visibility(
          visible: clearable,
          child: GestureDetector(
            onTap: () {
              controller.clear();
              clearable = false;
              setState(() {});
            },
            child: Transform.scale(
              scale: 1.2,
              child: Transform.translate(
                offset: const Offset(0, 2),
                child: const Icon(Icons.cancel, size: 16, color: AppColors.description),
              ),
            ),
          ),
        ),
        suffixIcon: widget.suffix ?? buildObscure(),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: widget.placeholder,
        hintStyle: TextStyle(color: Colors.black.withAlpha(70), fontSize: 16),
      ),
      // forceErrorText: 'sdafasf',
    );
  }

  buildObscure() {
    if (!widget.obscured) return null;
    return GestureDetector(
      onTap: () {
        obscured = !obscured;
        setState(() {});
      },
      child: Icon(obscured ? IconFont.eye_opened : IconFont.eye_closed, size: 12),
    );
  }
}
