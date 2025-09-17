import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import '../../styles/styles.dart';

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
  final IconData? iconData;
  final Widget? icon;
  final double iconSize;
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
    this.iconData,
    this.icon,
    this.iconSize = 20.0,
    this.onTap,
    this.onSelect,
  });
}

class VicActionSheet<T> extends StatefulWidget {
  final T initValue;
  final List<VicAction<T>> actions;
  final bool closeOnTap;
  final ValueChanged<List<T>>? onChanged;
  final bool _selectable;
  final bool _multiple;

  const VicActionSheet({super.key, required this.actions, this.closeOnTap = true, required this.initValue, this.onChanged}) : _selectable = true, _multiple = false;

  @override
  _VicActionSheetState<T> createState() => _VicActionSheetState<T>();
}

class _VicActionSheetState<T> extends State<VicActionSheet<T>> {
  final values = <T>[];
  final backup = <T>[];

  bool get multiple => widget._selectable && widget._multiple;
  bool get changed => multiple && values.join('') != backup.join('');

  @override
  void initState() {
    values.add(widget.initValue);
    backup.add(widget.initValue);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final maxHeight = (Get.height * 0.8 / _kItemHeight).floor() * _kItemHeight;

    return Padding(
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
            title: Text(multiple ? '完成' : '取消', textAlign: TextAlign.center, style: const TextStyle(fontSize: 14)),
            textColor: multiple ? Colors.red : const Color(0xff666666),
            tileColor: Colors.white,
            minTileHeight: _kItemHeight,
            shape: const RoundedRectangleBorder(borderRadius: _kRdius),
            onTap: () {
              if (multiple && values.join('') != backup.join('')) {
                widget.onChanged?.call(values);
              }
              Get.back();
            },
          ),
        ],
      ),
    );
  }

  List<Widget> buildTiles(BuildContext context) {
    return ListTile.divideTiles(
      context: context,
      color: const Color(0xffeeeeee),
      tiles: widget.actions.map((action) {
        return _VicActionWidget(action: action, selectable: widget._selectable, selected: values.contains(action.value), onTap: () => tap(action));
      }),
    ).toList();
  }

  void tap(VicAction action) {
    action.onTap?.call(action, widget.actions);
    if (widget._selectable) {
      select(action);
    } else {
      if (action.toName != null) {
        Get.toNamed(action.toName!);
      }
      if (widget.closeOnTap) {
        Get.back();
      }
    }
  }

  void select(VicAction action) async {
    final selected = values.contains(action.value);
    if (widget._multiple) {
      final sure = await action.onSelect?.call(selected, action, widget.actions);
      if (sure != false) {
        selected ? values.remove(action.value) : values.add(action.value);
        setState(() {});
      }
      return;
    }
    if (!selected) {
      final sure = await action.onSelect?.call(selected, action, widget.actions);
      if (sure != false) {
        values
          ..clear()
          ..add(action.value);
        setState(() {});
        widget.onChanged?.call(values);
      }
    }

    if (widget.closeOnTap) {
      Get.back();
    }
  }
}

class _VicActionWidget<T> extends StatelessWidget {
  final bool selectable;
  final bool selected;
  final VicAction action;
  final VoidCallback onTap;
  const _VicActionWidget({super.key, required this.selectable, required this.action, required this.onTap, this.selected = false});

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
      leading: action.icon ?? (action.iconData == null ? null : Icon(Icons.chair, size: action.iconSize)),
      minLeadingWidth: action.iconSize,
      onTap: action.disabled ? null : onTap,
      tileColor: action.disabled ? const Color(0xffe9e9e9) : Colors.white,
      selectedColor: Colors.red,
      selectedTileColor: Colors.white,
      selected: selectable && selected,
    );
  }

  Icon get icon {
    double size = action.iconSize;
    IconData icon = Symbols.arrow_forward_ios_rounded;
    if (selectable) {
      icon = selected ? Symbols.check_circle_filled_rounded : Symbols.circle;
    } else {
      size = 18;
    }
    return Icon(icon, size: size, weight: 300, fill: selectable && selected ? 1 : 0);
  }
}
