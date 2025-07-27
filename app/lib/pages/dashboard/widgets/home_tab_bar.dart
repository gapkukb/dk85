import 'package:app/pages/dashboard/widgets/home_tab_bar_indicator.dart';
import 'package:app/theme/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app/iconfont/index.dart';
import 'package:flutter/material.dart';

class _HomeTabBar {
  final IconData icon;
  final String label;
  final Color color;
  const _HomeTabBar(this.icon, this.label, this.color);
}

class HomeTabBar extends StatelessWidget implements PreferredSizeWidget {
  static const tabs = <_HomeTabBar>[
    _HomeTabBar(IconFont.hotfill, '热门', Color(0xfffe0002)),
    _HomeTabBar(IconFont.slots1, '老虎机', Color(0xff00cfa7)),
    _HomeTabBar(IconFont.buyu, '捕鱼', Color(0xfffe8e02)),
    _HomeTabBar(IconFont.qipai, '棋牌', Color(0xff9300ff)),
    _HomeTabBar(IconFont.chouma, '真人', Color(0xfffb01ff)),
  ];

  const HomeTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      labelStyle: TextStyle(fontSize: 12),
      indicator: UnderlineArrowTabIndicator(color: AppColor.main, radius: 10),
      dividerHeight: 0,
      tabs: tabs.map((tab) {
        return Column(
          children: [
            Icon(tab.icon, color: tab.color, size: 20),
            Text(tab.label, style: TextStyle(color: Color(0xff111111))),
            SizedBox(height: 4),
          ],
        );
      }).toList(),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(40);
}
