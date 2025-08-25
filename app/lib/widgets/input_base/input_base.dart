import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '/theme/index.dart';

class AKBaseInput extends StatefulWidget {
  final TextEditingController? controller;
  final String? initialValue;
  final FocusNode? focusNode;
  final InputDecoration decoration = const InputDecoration();
  final TextInputType? keyboardType;
  final TextInputAction textInputAction;
  final TextStyle? style;
  final TextAlign textAlign = TextAlign.start;
  final bool autofocus = false;
  final bool readOnly = false;
  final bool obscureText;
  final int? maxLength;
  final ValueChanged<String>? onChanged;
  final GestureTapCallback? onTap;
  final bool onTapAlwaysCalled = false;
  final TapRegionCallback? onTapOutside;
  final TapRegionUpCallback? onTapUpOutside;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final bool? enabled;
  final bool? ignorePointers;
  final Brightness? keyboardAppearance;
  final Iterable<String>? autofillHints;
  final AutovalidateMode? autovalidateMode;
  final Widget? prefix;
  final Widget? prefixIcon;
  final Color? prefixIconColor;
  final IconData? prefixIconName;
  final BoxConstraints? prefixIconConstraints;
  final Widget? suffix;
  final Widget? suffixIcon;
  final Color? suffixIconColor;
  final IconData? suffixIconName;
  final String? placeholder;
  final BoxConstraints? suffixIconConstraints;
  final EdgeInsets? contentPadding;
  final double marginBottom;

  const AKBaseInput({
    super.key,
    this.controller,
    this.initialValue,
    this.focusNode,
    this.keyboardType,
    this.textInputAction = TextInputAction.next,
    this.style,
    this.maxLength,
    this.onChanged,
    this.onTap,
    this.onTapOutside,
    this.onTapUpOutside,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onSaved,
    this.validator,
    this.inputFormatters,
    this.enabled,
    this.ignorePointers,
    this.keyboardAppearance,
    this.autofillHints,
    this.autovalidateMode,
    this.prefix,
    this.prefixIcon,
    this.prefixIconName,
    this.suffix,
    this.suffixIcon,
    this.suffixIconName,
    this.placeholder,
    this.prefixIconColor,
    this.prefixIconConstraints,
    this.suffixIconConstraints,
    this.suffixIconColor,
    this.contentPadding,
    this.marginBottom = 8.0,
    this.obscureText = false,
  });
  @override
  State<AKBaseInput> createState() => _AKBaseInputState();
}

class _AKBaseInputState extends State<AKBaseInput> {
  late final TextEditingController controller;
  final stream = StreamController<bool>();

  @override
  void initState() {
    controller = widget.controller ?? TextEditingController();
    controller.addListener(updateClearable);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(height: 0.8, fontSize: 10);
    return Padding(
      padding: EdgeInsets.only(bottom: widget.marginBottom),
      child: TextFormField(
        controller: controller,
        initialValue: widget.initialValue,
        focusNode: widget.focusNode,
        keyboardType: widget.keyboardType,
        textInputAction: widget.textInputAction,
        style: widget.style,
        maxLength: widget.maxLength,
        onChanged: widget.onChanged,
        onTap: widget.onTap,
        onTapOutside: widget.onTapOutside,
        onTapUpOutside: widget.onTapUpOutside,
        onEditingComplete: widget.onEditingComplete,
        onFieldSubmitted: widget.onFieldSubmitted,
        onSaved: widget.onSaved,
        validator: widget.validator,
        inputFormatters: widget.inputFormatters,
        enabled: widget.enabled,
        obscureText: widget.obscureText,
        ignorePointers: widget.ignorePointers,
        keyboardAppearance: widget.keyboardAppearance,
        autofillHints: widget.autofillHints,
        autovalidateMode: widget.autovalidateMode,
        // cursorHeight:
        //     Theme.of(context).inputDecorationTheme.hintStyle!.fontSize! * 1.2,
        cursorErrorColor: Theme.of(context).textSelectionTheme.cursorColor,
        spellCheckConfiguration: const SpellCheckConfiguration.disabled(),
        autocorrect: false,
        obscuringCharacter: '*',
        // cursorWidth: 1,
        decoration: widget.decoration.copyWith(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          helperText: ' ',
          counterText: ' ',
          helperStyle: style,
          errorStyle: style,
          errorMaxLines: 1,
          alignLabelWithHint: false,
          hintText: widget.placeholder,
          prefix: widget.prefix,
          prefixIcon: widget.prefixIcon ?? buildIcon(widget.prefixIconName),
          prefixIconColor: widget.prefixIconColor,
          prefixIconConstraints: widget.prefixIconConstraints,
          suffix: buildSuffix(),
          suffixIcon: widget.suffixIcon ?? buildIcon(widget.suffixIconName),
          suffixIconColor: widget.suffixIconColor,
          suffixIconConstraints: widget.suffixIconConstraints,
          contentPadding: widget.contentPadding,
        ),
      ),
    );
  }

  Widget? buildIcon(IconData? name) {
    if (name == null) return null;
    return Align(alignment: Alignment.centerRight, child: Icon(name, size: 20));
  }

  Widget buildSuffix() {
    if (widget.suffix == null) return buildClearButton();
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [buildClearButton(), widget.suffix!],
    );
  }

  StreamBuilder<bool> buildClearButton() {
    return StreamBuilder<bool>(
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
                scale: 2,
                child: const Icon(
                  Icons.cancel,
                  size: 10,
                  color: AppColors.description,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  updateClearable() {
    stream.add(controller.text.isNotEmpty);
  }

  @override
  void dispose() {
    controller.removeListener(updateClearable);
    if (widget.controller == null) {
      controller.dispose();
    }
    stream.close();
    super.dispose();
  }
}
