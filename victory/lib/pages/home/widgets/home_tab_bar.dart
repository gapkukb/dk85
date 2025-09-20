import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/rounded_tab_indicator/rounded_tab_indicator.dart';
import '../../../styles/styles.dart';

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
  const HomeTabBar({Key? key}) : super(key: key);
  static const _size = 52.0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: TabBar(
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
        indicatorWeight: 0,
        labelStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, height: 1),
        labelColor: AppColor.white,
        indicator: RoundedTabIndicator(height: 16, color: AppColor.primary, bottom: -2),
        dividerHeight: 0,
        tabs: tabs
            .map(
              (e) => Tab(
                height: _size,
                icon: Image.asset(
                  e.iconPath,
                  width: 32,
                  height: 32,
                ),
                child: Padding(
                  padding: AppGutter.top_4,
                  child: Text(e.name.tr),
                ),
                // text: e.name.tr,
              ),
            )
            .toList(),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(_size);
}
