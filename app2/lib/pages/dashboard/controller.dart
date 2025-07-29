import 'package:app2/iconfont/index.dart';
import 'package:app2/pages/fishing/index.dart';
import 'package:app2/pages/fishing/view.dart';
import 'package:app2/pages/foru/index.dart';
import 'package:app2/pages/foru/view.dart';
import 'package:app2/pages/funds/index.dart';
import 'package:app2/pages/funds/view.dart';
import 'package:app2/pages/home/bindings.dart';
import 'package:app2/pages/home/view.dart';
import 'package:app2/pages/me/index.dart';
import 'package:app2/pages/me/view.dart';
import 'package:app2/pages/promos/bindings.dart';
import 'package:app2/pages/promos/view.dart';
import 'package:app2/routes/app_pages.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'index.dart';

class Tab {
  final IconData icon;
  final String label;
  final String routeName;
  final Widget Function()? page;
  final Bindings binding;

  const Tab({
    required this.icon,
    required this.label,
    required this.routeName,
    required this.page,
    required this.binding,
  });
}

class DashboardController extends GetxController {
  DashboardController();
  final currentIndex = 0.obs;
  final tabs = [
    Tab(
      icon: IconFont.qipaishi,
      label: "首页",
      routeName: Routes.HOME,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    Tab(
      icon: IconFont.liwu,
      label: "福利",
      routeName: Routes.PROMOS,
      page: () => const PromosPage(),
      binding: PromosBinding(),
    ),
    Tab(
      icon: IconFont.qianbao,
      label: "钱包",
      routeName: Routes.FUNDS,
      page: () => const FundsPage(),
      binding: FundsBinding(),
    ),
    Tab(
      icon: IconFont.yonghu,
      label: "我的",
      routeName: Routes.ME,
      page: () => const MePage(),
      binding: MeBinding(),
    ),
  ];

  void changePage(int index) {
    Get.offAndToNamed(tabs[index].routeName, id: 1);
    currentIndex.value = index;
  }

  Route? onGenerateRoute(RouteSettings settings) {
    final tab = tabs.firstWhereOrNull(
      (item) => item.routeName == settings.name,
    );

    if (tab == null) {
      return GetPageRoute(settings: settings, page: () => Text("data"));
    }

    return GetPageRoute(
      settings: settings,
      page: tab.page,
      binding: tab.binding,
      transition: Transition.topLevel,
    );
  }
}
