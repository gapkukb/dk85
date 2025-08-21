import 'package:app/services/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/iconfont/index.dart';
import '/shared/customer_service/customer_service.dart';
import '../../shared/locale_selector/locale_selector.dart';
import '/theme/index.dart';
import '/widgets/rounded_tab_indicator.dart';
import '/shared/balance/balance.dart';
part './main_auth.dart';
part './main_simple_user.dart';

final tabs = <_Tab>[
  _Tab('assets/icons/hot.webp', 'hot'),
  _Tab('assets/icons/slots.webp', 'slots'),
  _Tab('assets/icons/fishing.webp', 'fishing'),
  _Tab('assets/icons/poker.webp', 'poker'),
];

class MainViewHeader extends StatelessWidget implements PreferredSizeWidget {
  const MainViewHeader({super.key});

  static final _auth = AuthService.to;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      titleSpacing: 8,
      title: Obx(() => _auth.authed.value ? SimpleUser() : Auth()),
      bottom: buildTabbar(),
      actionsPadding: const EdgeInsets.only(right: 8),
      actions: [
        IconButton(
          constraints: const BoxConstraints(minHeight: 36, minWidth: 36),
          style: IconButton.styleFrom(
            backgroundColor: Colors.white,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          padding: const EdgeInsets.all(0.0),
          icon: Icon(IconFont.sousuo, size: 22, color: AppColors.primary),
          onPressed: () {},
        ),
        SizedBox(width: 4),
        LocaleSelector(
          size: 36,
          iconSize: 24,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        SizedBox(width: 4),
        CustomerServiceTrigger(
          size: 36,
          iconSize: 26,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ],
    );
  }

  buildTabbar() {
    return TabBar(
      labelStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
      unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
      dividerHeight: 0,
      indicatorWeight: 0,
      labelColor: Colors.white,
      indicator: RoundedTabIndicator(
        height: 20,
        color: AppColors.primary,
        bottom: 3,
      ),
      tabs: [
        ...tabs.map(
          (tab) => Tab(
            height: 56,
            icon: Image.asset(tab.iconPath, width: 32, height: 32),
            text: tab.name,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(96);
}

class _Tab {
  final String iconPath;
  final String name;

  _Tab(this.iconPath, this.name);
}
