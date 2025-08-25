import 'package:app/iconfont/index.dart';
import 'package:app/shared/action_sheet/action_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Filter extends GetView<SearchController> {
  const Filter({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: show, icon: Icon(IconFont.guolvqi));
  }

  show() async {
    Get.showMutipleActionSheet(
      initValue: ['all'],
      options: [
        {"name": "All", "value": 'all'},
        {"name": "One", "value": 'one'},
        {"name": "One", "value": 'one2'},
      ],
      onSelect: (current, value) {
        if (current == 'all') {
          value.clear();
        } else {
          value.remove('all');
        }
        value.add(current);
      },
      onChange: (value) {
        print("value123:$value");
      },
    );
  }
}
