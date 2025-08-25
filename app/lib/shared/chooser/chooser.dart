part of 'index.dart';

class Chooser<T> extends StatefulWidget {
  final T initValue;
  final bool autoClose;
  final ChooserOptions<T> options;
  final void Function(T value, T? current)? onChanged;
  final Widget Function(String title, T value)? builder;

  const Chooser({
    super.key,
    required this.initValue,
    required this.options,
    this.onChanged,
    this.autoClose = true,
    this.builder,
  });

  static List<Choose<T>> covert<T>(ChooserOptions<T> options) {
    final lk = options.titleKey ?? 'title';
    final vk = options.valueKey ?? 'value';

    if (options.items != null) {
      return options.items!;
    }
    if (options.options != null) {
      return options.options!
          .map(
            (option) => Choose<T>(
              title: option[lk] ?? 'Invalid Label',
              value: option[vk],
            ),
          )
          .toList();
    }
    return [];
  }

  @override
  _ChooserState createState() => _ChooserState<T>();
}

class _ChooserState<T> extends State<Chooser<T>> {
  late List<T> value;
  late List<Choose<T>> items;

  @override
  void initState() {
    value = [widget.initValue];
    items = Chooser.covert(widget.options);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: show,
      child: Container(child: Text('test')),
    );
  }

  void show() {
    Get.bottomSheet<T>(
      ChooserBody<T>(
        initValue: value,
        items: items,
        options: widget.options,
        onTap: (values, current, changed) async {
          if (widget.autoClose) {
            await Future.delayed(Durations.short3);
            Get.back();
          }
          if (changed) {
            value = values;
            widget.onChanged?.call(values[0], current);
            setState(() {});
          }
        },
      ),
    );
  }
}
