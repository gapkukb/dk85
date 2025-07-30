import '../../iconfont/index.dart';
import '../fishing/index.dart';
import '../fishing/view.dart';
import '../foru/index.dart';
import '../foru/view.dart';
import '../funds/index.dart';
import '../funds/view.dart';
import '../home/bindings.dart';
import '../home/view.dart';
import '../me/index.dart';
import '../me/view.dart';
import '../promos/bindings.dart';
import '../promos/view.dart';
import '../../routes/app_pages.dart';
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
      return GetPageRoute(settings: settings, page: () => const Text("data"));
    }

    return GetPageRoute(
      settings: settings,
      page: tab.page,
      binding: tab.binding,
      transition: Transition.topLevel,
    );
  }
}
