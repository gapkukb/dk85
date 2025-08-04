import 'package:flutter/material.dart';
import '../checkbox_list_tile/index.dart';

class AkCheckboxListItem<T> {
  final String title;
  final T value;

  AkCheckboxListItem(this.title, this.value);
}

class AkCheckboxList<T> extends StatefulWidget {
  final List<AkCheckboxListItem<T>> actions;
  final T initialValue;
  final ValueChanged<T>? onChanged;

  const AkCheckboxList({super.key, required this.actions, required this.initialValue, this.onChanged});

  @override
  State<AkCheckboxList<T>> createState() => _AkCheckboxListState<T>();
}

class _AkCheckboxListState<T> extends State<AkCheckboxList<T>> {
  late T current;

  @override
  void initState() {
    super.initState();
    current = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      itemExtent: 48,
      shrinkWrap: true,
      children: widget.actions.map((item) {
        return AkCheckboxListTile(
          titleText: item.title,
          groupValue: current,
          value: item.value,
          onChanged: (value) {
            if (value != widget.initialValue) {
              setState(() {
                current = value;
              });
              widget.onChanged?.call(current);
            }
          },
        );
      }).toList(),
    );
  }
}
