import '/theme/index.dart';
import '/ui/tab/rounded_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class _HomeTabBar {
  final AssetImage icon;
  final String label;
  // final Color color;
  const _HomeTabBar(this.icon, this.label);
}

class HomeTabBar extends StatelessWidget implements PreferredSizeWidget {
  static final tabs = <_HomeTabBar>[
    const _HomeTabBar(AssetImage("assets/images/hot.webp"), 'app.foru'),
    const _HomeTabBar(AssetImage("assets/images/slots.webp"), 'app.slots'),
    const _HomeTabBar(AssetImage("assets/images/fishing.webp"), 'app.fishing'),
    const _HomeTabBar(AssetImage("assets/images/poker.webp"), 'app.poker'),
    // _HomeTabBar(const AssetImage("assets/images/casino.webp"), '真人'.tr),
  ];

  const HomeTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      labelStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
      unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
      dividerHeight: 0,
      indicatorWeight: 0,
      labelColor: Colors.white,
      indicator: RoundedTabIndicator(height: 24, color: AppColors.primary, bottom: 3),
      tabs: tabs.map((tab) {
        return Tab(
          height: 56,
          icon: Image(image: tab.icon, width: 28, height: 28),
          text: tab.label.tr,
        );
      }).toList(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
