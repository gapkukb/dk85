import 'package:app/pages/dashboard/widgets/home_tab_bar_indicator.dart';
import 'package:app/theme/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app/iconfont/index.dart';
import 'package:flutter/material.dart';

class _HomeTabBar {
  final IconData icon;
  final String label;
  const _HomeTabBar(this.icon, this.label);
}

class HomeTabBar extends StatelessWidget implements PreferredSizeWidget {
  static const tabs = <_HomeTabBar>[
    _HomeTabBar(IconFont.home_nav_hot, '热门'),
    _HomeTabBar(IconFont.home_nav_slots, '老虎机'),
    _HomeTabBar(IconFont.home_nav_fishing, '捕鱼'),
    _HomeTabBar(IconFont.home_nav_poker, '棋牌'),
    _HomeTabBar(IconFont.home_nav_casino, '真人'),
  ];

  const HomeTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicator: UnderlineArrowTabIndicator(color: AppColor.main, radius: 10),
      tabs: tabs.map((tab) {
        return Column(children: [Icon(tab.icon), Text(tab.label)]);
      }).toList(),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(40);
}
