import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theme/index.dart';

class BaseInput extends StatefulWidget {
  final String? placeholder;
  final IconData? icon;
  final Widget? prefix;
  final Widget? suffix;
  final void Function(String? value) onSaved;
  final String? Function(String? value) validator;
  final TextEditingController? controller;
  final bool obscureText;
  final bool autofocus;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final int? maxLength;
  final String? initialValue;

  const BaseInput({
    super.key,
    this.placeholder,
    this.icon,
    this.prefix,
    this.suffix,
    this.controller,
    this.obscureText = false,
    this.autofocus = false,
    this.keyboardType,
    this.maxLength,
    this.textInputAction,
    this.initialValue,
    required this.onSaved,
    required this.validator,
  });

  @override
  BaseInputState createState() => BaseInputState();
}

class BaseInputState extends State<BaseInput> {
  late final TextEditingController controller;
  final stream = StreamController<bool>();

  @override
  void initState() {
    controller = widget.controller ?? TextEditingController();
    controller.addListener(() {
      stream.add(controller.text.isNotEmpty);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorHeight: 16,
      style: TextStyle(fontSize: 16),
      validator: widget.validator,
      keyboardType: widget.keyboardType,
      initialValue: widget.initialValue,
      maxLength: widget.maxLength,
      obscureText: widget.obscureText,
      autofocus: widget.autofocus,
      textInputAction: widget.textInputAction,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],

      decoration: InputDecoration(
        counterText: '',
        filled: true,
        fillColor: Color(0xfff6f6f6),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(width: 0, style: BorderStyle.none),
        ),
        prefixIcon:
            widget.prefix ?? (widget.icon == null ? null : Icon(widget.icon)),
        suffix: StreamBuilder<bool>(
          initialData: false,
          stream: stream.stream,

          builder: (context, snapshot) {
            return Visibility(
              visible: snapshot.data!,
              child: GestureDetector(
                onTap: controller.clear,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Transform.scale(
                    scale: 1.2,
                    child: Transform.translate(
                      offset: Offset(0, 2),
                      child: Icon(
                        Icons.cancel,
                        size: 16,
                        color: AppColors.description,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        suffixIcon: widget.suffix,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: widget.placeholder,
        hintStyle: TextStyle(color: Colors.black.withAlpha(70), fontSize: 16),
      ),
      // forceErrorText: 'sdafasf',
    );
  }
}
