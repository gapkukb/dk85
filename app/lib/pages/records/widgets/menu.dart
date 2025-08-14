import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/iconfont/index.dart';
import '/theme/index.dart';
import '../index.dart';

class Menu extends StatelessWidget {
  final RecordsController controller;
  const Menu({super.key, required this.controller});

  // RecordsController get controller => Get.find<RecordsController>();

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(fontSize: 14, color: AppColors.title);

    return ListView(
      shrinkWrap: true,
      children: [
        for (var menu in controller.tabs)
          ListTile(
            title: Text(menu.name),
            titleTextStyle: style,
            selected: menu.value == controller.current.value,
            selectedColor: AppColors.primary,
            selectedTileColor: Colors.white,
            trailing: menu.value == controller.current.value ? const Icon(IconFont.chenggong, size: 16, color: AppColors.primary) : null,
            onTap: () {
              controller.select(menu);
            },
          ),
      ],
    );
  }
}
