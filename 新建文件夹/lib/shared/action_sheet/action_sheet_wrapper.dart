part of 'action_sheet.dart';

class ActionSheetWrapper extends StatefulWidget {
  final Iterable<ActionSheetAction> actions;
  final String initValue;
  final bool? closeOnTap;
  final Function(String value, ActionSheetAction action)? onChange;

  const ActionSheetWrapper({
    super.key,
    required this.actions,
    required this.initValue,
    this.closeOnTap = true,
    this.onChange,
  });

  @override
  State<ActionSheetWrapper> createState() => _ActionSheetWrapperState();
}

class _ActionSheetWrapperState extends State<ActionSheetWrapper> {
  late String value;

  @override
  void initState() {
    value = widget.initValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
            ),
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

          SizedBox(height: 8),
          MaterialButton(
            minWidth: double.infinity,
            padding: EdgeInsets.all(0),
            height: 48,
            color: Colors.white,
            onPressed: Get.back,
            child: Text("取消"),
          ),
          SizedBox(height: MediaQuery.of(context).padding.bottom),
        ],
      ),
    );
  }

  List<Widget> _buildChildren(BuildContext context) {
    print("value _buildChildren");
    return ListTile.divideTiles(
      context: context,
      color: AppColors.background,
      tiles: widget.actions.map(buildItem),
    ).toList();
  }

  ListTile buildItem(ActionSheetAction action) {
    return ListTile(
      minTileHeight: 48,
      titleTextStyle: TextStyle(fontSize: 14, color: AppColors.title),
      title: Text(action.title),
      selected: action.value == value,
      trailing: Icon(
        action.value == value ? IconFont.selected : IconFont.unselected,
        size: 20,
      ),
      onTap: () => onTap(action),
    );
  }

  void onTap(ActionSheetAction action) {
    if (action.value == value) {
      Get.back();
    } else {
      value = action.value;
      widget.onChange?.call(value, action);
      Get.back(result: action.value);
      setState(() {});
    }
  }
}
