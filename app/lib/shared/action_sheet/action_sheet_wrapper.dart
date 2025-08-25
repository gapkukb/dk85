part of 'action_sheet.dart';

class ActionSheetWrapper<T> extends StatefulWidget {
  final bool mutiple;
  final List<ActionSheetAction<T>>? actions;
  final List<Map<String, dynamic>> options;
  final String? labelKey;
  final String? valueKey;
  final String? title;
  final List<T> initValue;
  final bool? closeOnTap;
  final Function(T current, List<T> value)? onSelect;
  final Function(List<T> value)? onChange;

  const ActionSheetWrapper({
    super.key,
    this.actions,
    required this.initValue,
    this.closeOnTap = true,
    this.onChange,
    this.onSelect,
    this.mutiple = false,
    this.options = const [],
    this.labelKey,
    this.valueKey,
    this.title,
  });

  @override
  _ActionSheetWrapperState<T> createState() => _ActionSheetWrapperState<T>();
}

class _ActionSheetWrapperState<T> extends State<ActionSheetWrapper<T>> {
  late List<T> value;
  late List<ActionSheetAction<T>> actions;

  @override
  void initState() {
    super.initState();
    value = List<T>.from(widget.initValue);
    actions =
        widget.actions ??
        widget.options
            .map(
              (option) => ActionSheetAction<T>(
                title: option[widget.labelKey]?.toString() ?? 'invalid title',
                value: option[widget.valueKey] as T,
              ),
            )
            .where((action) => action.value != null)
            .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.mutiple || widget.title != null)
            ListTile(
              tileColor: AppColors.border,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              ),
              minTileHeight: 42,
              contentPadding: EdgeInsets.only(left: 16, right: 0),
              title: widget.title == null ? null : Text(widget.title!),
              trailing: widget.mutiple
                  ? TextButton(
                      onPressed: onconfirm,
                      child: Text(
                        'app.confirm'.tr,
                        style: TextStyle(color: AppColors.highlight),
                      ),
                    )
                  : null,
            ),
          Material(
            color: Colors.white,
            clipBehavior: Clip.hardEdge,
            borderRadius: widget.mutiple
                ? BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  )
                : BorderRadius.circular(8),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: 48 * 8,
                minWidth: double.infinity,
              ),
              child: ListView(
                padding: EdgeInsets.all(0),
                cacheExtent: 48,
                shrinkWrap: true,
                children: _buildChildren(context),
              ),
            ),
          ),
          SizedBox(height: 8),
          MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            minWidth: double.infinity,
            padding: EdgeInsets.all(0),
            height: 48,
            color: Colors.white,
            onPressed: Get.back,
            child: Text('app.cancel'.tr),
          ),
          SizedBox(height: MediaQuery.of(context).padding.bottom),
        ],
      ),
    );
  }

  List<Widget> _buildChildren(BuildContext context) {
    return ListTile.divideTiles(
      context: context,
      color: AppColors.background,
      tiles: actions.map(buildItem),
    ).toList();
  }

  ListTile buildItem(ActionSheetAction<T> action) {
    final selected = value.contains(action.value);
    return ListTile(
      minTileHeight: 48,
      titleTextStyle: TextStyle(fontSize: 14, color: AppColors.title),
      title: Text(action.title),
      selected: selected,
      trailing: Icon(
        selected ? IconFont.selected : IconFont.unselected,
        size: 20,
      ),
      onTap: () => widget.mutiple ? _mutiple(action) : _single(action),
    );
  }

  void _mutiple(ActionSheetAction<T> action) {
    if (widget.onSelect == null) {
      if (value.contains(action.value)) {
        value.remove(action.value);
      } else {
        value.add(action.value);
      }
    } else {
      widget.onSelect!(action.value, value);
    }
    setState(() {});
  }

  void _single(ActionSheetAction<T> action) {
    if (value.contains(action.value)) {
      Get.back();
    } else {
      value = [action.value];
      widget.onChange?.call(value);
      // 过滤掉null，保证类型安全
      Get.back<List<T>>(result: value.whereType<T>().toList());
      setState(() {});
    }
  }

  void onconfirm() {
    final diff = value.toSet().difference(widget.initValue.toSet()).length;
    if (diff == 0) {
      Get.back();
    } else {
      // 过滤掉null，保证类型安全
      Get.back<List<T>>(result: value.whereType<T>().toList());
      widget.onChange?.call(value);
    }
  }
}
