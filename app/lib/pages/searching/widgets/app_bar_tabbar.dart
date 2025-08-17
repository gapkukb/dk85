import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../theme/index.dart';
import '../../../ui/tab/rounded_tab_indicator.dart';
import '../index.dart';

class AppBarTabbarWidget extends GetView<SearchingController> implements PreferredSizeWidget {
  const AppBarTabbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: controller.kind,
      labelStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
      unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
      dividerHeight: 0,
      indicatorWeight: 0,
      indicator: RoundedTabIndicator(height: 24, color: AppColors.primary),
      padding: const EdgeInsets.all(12),
      tabs: controller.state.kinds.map((item) => Tab(text: item.name, height: 24)).toList(),
      onTap: controller.search,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(48);
}
