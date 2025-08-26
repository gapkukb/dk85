part of 'index.dart';

class Chooser<T> extends StatefulWidget {
  final T initValue;
  final bool autoClose;
  final ChooserOptions<T> options;
  final void Function(T value, Choose<T> current)? onChanged;
  final Widget Function(BuildContext context, String title, T value)? builder;

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
  late Choose<T> current;

  @override
  void initState() {
    value = [widget.initValue];
    items = Chooser.covert(widget.options);
    current = items.firstWhere(
      (item) => item.value == widget.initValue,
      orElse: () => items[0],
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: show,
      child:
          widget.builder?.call(context, current.title, current.value) ??
          buildTrigger(),
    );
  }

  buildTrigger() {
    final style = TextStyle(
      fontSize: 12,
      color: AppColors.label,
    ).merge(widget.options.style);

    return Container(
      width: widget.options.width,
      height: widget.options.height ?? 24,
      padding: widget.options.padding ?? EdgeInsets.only(left: 8, right: 8),
      decoration:
          widget.options.decoration ??
          BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(100),
          ),

      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 4,
        children: [
          if (widget.options.prefix != null) widget.options.prefix!,
          if (widget.options.prefixText != null)
            Text(widget.options.prefixText!, style: style),

          Text(current.title, style: style),
          Icon(IconFont.arrow_down_ios, size: 10, color: style.color),
        ],
      ),
    );
  }

  void show() {
    Get.bottomSheet<T>(
      ChooserBody<T>(
        initValue: value,
        items: items,
        options: widget.options,
        onTap: (values, title, current, changed) async {
          if (widget.autoClose) {
            await Future.delayed(Durations.short3);
            Get.back();
          }
          if (changed) {
            value = values;
            this.current = current;
            widget.onChanged?.call(values[0], current);
            setState(() {});
          }
        },
      ),
    );
  }
}
