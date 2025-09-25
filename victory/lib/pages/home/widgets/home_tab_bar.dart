import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:victory/components/rounded_tab_indicator/rounded_tab_indicator.dart';
import 'package:victory/theme/theme.dart';

class _Tab {
  final String iconPath;
  final String name;

  const _Tab(this.iconPath, this.name);
}

const tabs = <_Tab>[
  _Tab('assets/icons/hot.webp', 'app.foru'),
  _Tab('assets/icons/slots.webp', 'app.slots'),
  _Tab('assets/icons/fishing.webp', 'app.fishing'),
  _Tab('assets/icons/poker.webp', 'app.poker'),
];

class HomeTabBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeTabBar({super.key});
  @override
  Widget build(BuildContext context) {
    return TabBar(
      unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal, height: 1),
      indicatorWeight: 0,
      labelStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, height: 1),
      labelColor: AppColors.white,
      indicator: RoundedTabIndicator(height: 20, color: AppColors.primary, bottom: 2),
      dividerHeight: 0,
      // padding: const EdgeInsets.only(bottom: 4),
      labelPadding: const EdgeInsets.only(bottom: 4),

      tabs: tabs
          .map(
            (e) => Tab(
              iconMargin: const EdgeInsets.only(bottom: 12),
              height: 56.0,
              icon: Image.asset(
                e.iconPath,
                width: 32,
                height: 32,
              ),
              text: e.name.tr,
            ),
          )
          .toList(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(0);
}
