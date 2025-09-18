import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import '/styles/styles.dart';

const _kItemHeight = 48.0;
const _kRdius = BorderRadius.all(Radius.circular(8.0));
typedef VicActionCallback = void Function(VicAction action, List<VicAction> actions);
typedef VicActionAsyncCallback = FutureOr<bool?> Function(bool selected, VicAction action, List<VicAction> actions);

class VicAction<T> {
  final String title;
  final T value;
  final String? subtitle;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final bool disabled;
  final String? toName;
  final IconData? leadingIcon;
  final Color? leadingIconColor;
  final Widget? leading;
  final double minLeadingWidth;
  final double leadingGap;
  final VicActionCallback? onTap;
  final VicActionAsyncCallback? onSelect;
  const VicAction({
    required this.title,
    required this.value,
    this.toName,
    this.disabled = false,
    this.subtitle,
    this.titleStyle,
    this.subtitleStyle,
    this.leadingIcon,
    this.leading,
    this.leadingGap = 8.0,
    this.minLeadingWidth = 20.0,
    this.leadingIconColor,
    this.onTap,
    this.onSelect,
  });
}

class VicActionSheet<T> extends StatefulWidget {
  final List<VicAction<T>> actions;
  final bool closeOnTap;
  final ValueChanged<List<T>>? _onChanged;
  final bool _multiple;
  final List<T>? _initValues;

  const VicActionSheet({super.key, required this.actions, this.closeOnTap = true}) : _multiple = false, _initValues = null, _onChanged = null;

  @override
  _VicActionSheetState<T> createState() => _VicActionSheetState<T>();

  VicActionSheet.single({super.key, required T initValue, required this.actions, this.closeOnTap = true, ValueChanged<T>? onChanged})
    : _multiple = false,
      _initValues = [initValue],
      _onChanged = ((List<T> values) => onChanged?.call(values.first));

  const VicActionSheet.multiple({
    super.key,
    required List<T> initValue,
    required this.actions,
    this.closeOnTap = false,
    ValueChanged<List<T>>? onChanged,
  }) : _multiple = true,
       _initValues = initValue,
       _onChanged = onChanged;
}

class _VicActionSheetState<T> extends State<VicActionSheet<T>> {
  final values = <T>[];
  final backup = <T>[];

  bool get selecteable => widget._initValues != null;
  bool get isMultiple => selecteable && widget._multiple;
  bool get changed => isMultiple && values.join('') != backup.join('');

  @override
  void initState() {
    if (widget._initValues != null) {
      values.addAll(widget._initValues!);
      backup.addAll(widget._initValues!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final maxHeight = (Get.height * 0.8 / _kItemHeight).floor() * _kItemHeight;

    return SizedBox(
      width: Get.width,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Material(
              clipBehavior: Clip.antiAlias,
              borderRadius: const BorderRadius.all(Radius.circular(8.0)),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxHeight: maxHeight),
                child: ListView(
                  // padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  shrinkWrap: true,
                  children: buildTiles(context),
                ),
              ),
            ),
            const SizedBox(height: 4.0),
            ListTile(
              title: Text(isMultiple ? '完成' : '取消', textAlign: TextAlign.center, style: const TextStyle(fontSize: 14)),
              textColor: isMultiple ? Colors.red : const Color(0xff666666),
              tileColor: Colors.white,
              minTileHeight: _kItemHeight,
              shape: const RoundedRectangleBorder(borderRadius: _kRdius),
              onTap: () {
                if (isMultiple && values.join('') != backup.join('')) {
                  widget._onChanged?.call(values);
                }
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> buildTiles(BuildContext context) {
    return ListTile.divideTiles(
      context: context,
      color: const Color(0xffeeeeee),
      tiles: widget.actions.map((action) {
        return _VicActionWidget(
          action: action,
          selectable: selecteable,
          selected: values.contains(action.value),
          onTap: () => tap(action),
        );
      }),
    ).toList();
  }

  void tap(VicAction action) {
    action.onTap?.call(action, widget.actions);
    if (selecteable) {
      isMultiple ? multiple(action) : single(action);
    } else {
      if (action.toName != null) {
        Get.toNamed(action.toName!);
      }
      _tryClose();
    }
  }

  void single(VicAction action) async {
    final selected = values.contains(action.value);

    if (selected) return _tryClose();

    final sure = await action.onSelect?.call(selected, action, widget.actions);

    if (sure == false) return _tryClose();
    values.clear();
    values.add(action.value);
    setState(() {});

    widget._onChanged?.call(values);

    _tryClose();
  }

  void multiple(VicAction action) async {
    final selected = values.contains(action.value);
    final sure = await action.onSelect?.call(selected, action, widget.actions);
    if (sure == false) return _tryClose();
    selected ? values.remove(action.value) : values.add(action.value);
    setState(() {});
  }

  void _tryClose() {
    if (widget.closeOnTap) {
      Timer(Durations.medium1, Get.back);
    }
  }
}

class _VicActionWidget<T> extends StatelessWidget {
  final bool selectable;
  final bool selected;
  final VicAction action;
  final VoidCallback onTap;
  const _VicActionWidget({
    super.key,
    required this.selectable,
    required this.action,
    required this.onTap,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: styles.gutter.horizontal.px12,
      minTileHeight: _kItemHeight,
      title: Text(action.title),
      titleTextStyle: const TextStyle(fontSize: 14, color: Colors.black).merge(action.titleStyle),
      subtitle: action.subtitle == null ? null : Text(action.title),
      subtitleTextStyle: const TextStyle(fontSize: 12, color: Color(0xff999999)).merge(action.subtitleStyle),
      trailing: icon,
      leading:
          action.leading ??
          (action.leadingIcon == null
              ? null
              : Icon(
                  action.leadingIcon,
                  color: action.leadingIconColor,
                  size: action.minLeadingWidth,
                )),
      minLeadingWidth: action.minLeadingWidth,
      horizontalTitleGap: action.leadingGap,
      onTap: action.disabled ? null : onTap,
      tileColor: action.disabled ? const Color(0xffe9e9e9) : Colors.white,
      selectedColor: Colors.red,
      selectedTileColor: Colors.white,
      selected: selectable && selected,
    );
  }

  Icon get icon {
    double size = action.minLeadingWidth;
    IconData icon = Symbols.arrow_forward_ios_rounded;
    if (selectable) {
      icon = selected ? Symbols.check_circle_filled_rounded : Symbols.circle;
    } else {
      size = 18;
    }
    return Icon(icon, size: size, weight: 300, fill: selectable && selected ? 1 : 0);
  }
}

Future<void> showVicActionSheet<T>(VicActionSheet<T> actionsheet) async {
  if (actionsheet.actions.isEmpty) return;
  return Get.bottomSheet<void>(actionsheet, isScrollControlled: true, enableDrag: false);
}
