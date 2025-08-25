import 'package:app/iconfont/index.dart';
import 'package:app/shared/action_sheet/action_sheet.dart';
import 'package:app/theme/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

class Picker<T> extends StatefulWidget {
  final List<ActionSheetAction<T>>? actions;
  final List<Map<String, T>> options;
  final T? initValue;
  final String labelKey;
  final String valueKey;
  final ValueChanged<T>? onChange;
  final Decoration? decoration;
  final EdgeInsets? padding;
  final TextStyle? textStyle;
  final double? width;
  final double? height;
  final Color? color;
  final Widget? prefix;
  final String? prefixText;
  final BoxConstraints? constraints;
  final Widget Function(BuildContext context, T value, String title)? builder;

  const Picker({
    super.key,
    this.options = const [],
    this.initValue,
    this.labelKey = 'name',
    this.valueKey = 'value',
    this.onChange,
    this.builder,
    this.decoration,
    this.padding,
    this.textStyle,
    this.width,
    this.height,
    this.constraints,
    this.color,
    this.prefix,
    this.prefixText,
    this.actions,
  });

  @override
  _PickerState createState() => _PickerState<T>();
}

class _PickerState<T> extends State<Picker<T>> {
  late final List<ActionSheetAction<T>> actions;
  late T value;

  String get label {
    final action =
        actions.firstWhereOrNull((i) => i.value == value) ?? actions.first;
    return action.title;
  }

  @override
  void initState() {
    actions =
        widget.actions ??
        widget.options
            .map(
              (option) => ActionSheetAction<T>(
                title: option[widget.labelKey]?.toString() ?? 'invalid title',
                value: option[widget.valueKey] as T,
              ),
            )
            .toList();

    value =
        widget.initValue ??
        (actions.isNotEmpty ? actions.first.value : null as T);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: show, child: buildChild());
  }

  Widget buildChild() {
    if (widget.builder == null) {
      return Container(
        height: widget.height,
        width: widget.width,
        constraints: widget.constraints,
        padding:
            widget.padding ?? EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration:
            widget.decoration ??
            BoxDecoration(
              color: widget.color ?? Colors.white,
              borderRadius: BorderRadius.circular(24),
            ),
        child: DefaultTextStyle(
          style:
              widget.textStyle ??
              TextStyle(fontSize: 12, color: AppColors.label),
          child: Row(
            spacing: 4,
            children: [
              if (widget.prefix != null) widget.prefix!,
              if (widget.prefixText != null) Text(widget.prefixText!),
              Text(label),
              Icon(IconFont.arrow_down_ios, size: 10, color: AppColors.label),
            ],
          ),
        ),
      );
    }
    return widget.builder!(context, value, label);
  }

  void show() {
    Get.showActionSheet<T>(
      actions: actions,
      initValue: value,
      labelKey: widget.labelKey,
      valueKey: widget.valueKey,
      onChange: (value) {
        this.value = value;
        widget.onChange?.call(value);
        setState(() {});
      },
    );
  }
}
