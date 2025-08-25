import 'package:app/routes/app_pages.dart';
import 'package:app/services/index.dart';
import 'package:app/shared/simple_balance/simple_balance.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/iconfont/index.dart';
import '/shared/customer_service/customer_service.dart';
import '/shared/locale_selector/locale_selector.dart';
import '/theme/index.dart';
import '/widgets/rounded_tab_indicator.dart';
part './main_auth.dart';

final tabs = <_Tab>[
  _Tab('assets/icons/hot.webp', 'app.foru'.tr),
  _Tab('assets/icons/slots.webp', 'app.slots'.tr),
  _Tab('assets/icons/fishing.webp', 'app.fishing'.tr),
  _Tab('assets/icons/poker.webp', 'app.poker'.tr),
];

class MainViewHeader extends StatelessWidget implements PreferredSizeWidget {
  const MainViewHeader({super.key});

  static final _auth = AuthService.to;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 36,
      backgroundColor: Colors.transparent,
      titleSpacing: 12,
      title: Obx(
        () => _auth.authed.value ? SimpleBalance(depositable: true) : Auth(),
      ),
      bottom: buildTabbar(),
      actionsPadding: const EdgeInsets.only(right: 12),
      actions: [
        IconButton(
          constraints: const BoxConstraints(minHeight: 36, minWidth: 36),
          style: IconButton.styleFrom(
            backgroundColor: Colors.white,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          padding: const EdgeInsets.all(0.0),
          icon: Icon(IconFont.sousuo, size: 22, color: AppColors.primary),
          onPressed: () {
            Get.toNamed(Routes.search);
          },
        ),
        SizedBox(width: 8),
        LocaleSelector(
          size: 36,
          iconSize: 24,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        SizedBox(width: 8),
        CustomerServiceTrigger(),
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
        height: 24,
        color: AppColors.primary,
        bottom: 5,
      ),
      tabs: [
        ...tabs.map(
          (tab) => Tab(
            height: 64,
            icon: Image.asset(tab.iconPath, width: 32, height: 32),
            text: tab.name,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(112);
}

class _Tab {
  final String iconPath;
  final String name;

  _Tab(this.iconPath, this.name);
}
