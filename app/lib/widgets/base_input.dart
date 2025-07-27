import 'dart:async';

import 'package:app/iconfont/index.dart';
import 'package:app/theme/index.dart';
import 'package:flutter/material.dart';

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
    return SizedBox(
      width: double.infinity,
      // height: 1280,
      child: TextFormField(
        // expands: true,
        // maxLines: null,
        controller: controller,
        cursorHeight: 16,
        style: TextStyle(fontSize: 16),
        decoration: InputDecoration(
          isDense: true,
          filled: true,
          fillColor: Color(0xfff6f6f6),
          contentPadding: EdgeInsets.symmetric(horizontal: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide(width: 0, style: BorderStyle.none),
          ),
          // prefixIcon: Icon(IconFont.shouji),
          suffix: StreamBuilder<bool>(
            initialData: false,
            stream: stream.stream,

            builder: (context, snapshot) {
              return Visibility(
                visible: snapshot.data!,
                child: GestureDetector(
                  onTap: controller.clear,
                  child: Transform.translate(
                    offset: Offset(0, 4),
                    child: Icon(
                      Icons.cancel,
                      size: 20,
                      color: AppColor.description,
                    ),
                  ),
                ),
              );
            },
          ),
          suffixIcon: Icon(IconFont.shouji),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          // suffixText: "sadf",
          hintText: widget.placeholder,
          hintStyle: TextStyle(color: Colors.black.withAlpha(70)),
        ),
        forceErrorText: 'sdafasf',
      ),
    );
  }
}
