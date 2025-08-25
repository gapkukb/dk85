part of 'index.dart';

class ChooserBody<T> extends StatefulWidget {
  final List<T> initValue;
  final List<Choose<T>> items;
  final _BodyOptions<T> options;
  final bool multiple;
  final void Function(List<T> values, T? current, bool changed) onTap;

  const ChooserBody({
    super.key,
    required this.initValue,
    required this.options,
    required this.onTap,
    required this.items,
    this.multiple = false,
  });

  @override
  _ChooserBodyState createState() => _ChooserBodyState<T>();
}

class _ChooserBodyState<T> extends State<ChooserBody<T>> {
  static const r = Radius.circular(8);
  static const shape = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(r),
  );

  late List<T> value;

  @override
  void initState() {
    value = widget.initValue.toList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // print('changed builder ${widget.initValue}');
    final header = buildHeader();
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (header != null) header,
          buildBody(header == null),
          SizedBox(height: 4),
          MaterialButton(
            height: 48,
            color: Colors.white,
            shape: shape,
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('app.cancel'.tr),
          ),
        ],
      ),
    );
  }

  Widget? buildHeader() {
    final title = widget.options.title;
    if (title == null) return null;
    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: r, topRight: r),
      ),
      clipBehavior: Clip.antiAlias,
      child: ListTile(
        tileColor: AppColors.background,
        contentPadding: EdgeInsets.only(left: 16, right: 16),
        minTileHeight: 40,
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        trailing: buildConfirm(),
      ),
    );
  }

  Widget? buildConfirm() {
    return InkWell(
      onTap: onConfirm,
      child: Text(
        'app.confirm'.tr,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: AppColors.highlight,
        ),
      ),
    );
  }

  Widget buildBody(bool noHeader) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.5,
        minWidth: MediaQuery.of(context).size.width,
        maxWidth: MediaQuery.of(context).size.width,
      ),
      child: ListTileTheme(
        data: ListTileThemeData(
          minTileHeight: 48,
          iconColor: AppColors.title,
          contentPadding: EdgeInsets.only(left: 16, right: 16),
          titleTextStyle: TextStyle(fontSize: 14, color: AppColors.title),
        ),
        child: Material(
          shape: RoundedRectangleBorder(
            borderRadius: noHeader
                ? BorderRadius.all(r)
                : BorderRadius.only(bottomLeft: r, bottomRight: r),
          ),
          clipBehavior: Clip.antiAlias,
          child: ListView(
            shrinkWrap: true,
            children: ListTile.divideTiles(
              color: AppColors.background,
              context: context,
              tiles: widget.items.map((e) {
                return ListTile(
                  selected: value.contains(e.value),
                  title: Text(e.title),
                  trailing: Icon(
                    value.contains(e.value)
                        ? IconFont.selected
                        : IconFont.unselected,
                    size: 18,
                  ),
                  onTap: () => onTap(e),
                );
              }).toList(),
            ).toList(),
          ),
        ),
      ),
    );
  }

  onTap(Choose<T> e) async {
    if (widget.multiple) {
      if (value.contains(e.value)) {
        value.remove(e.value);
      } else {
        value.add(e.value);
      }
    } else {
      value = [e.value];
    }

    setState(() {});
    final length = value.toSet().difference(widget.initValue.toSet()).length;
    widget.onTap(value, e.value, length > 0);
  }

  void onConfirm() {
    final length = value.toSet().difference(widget.initValue.toSet()).length;
  }
}
