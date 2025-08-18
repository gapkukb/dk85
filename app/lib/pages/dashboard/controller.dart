import 'package:nil/nil.dart';

import '../../iconfont/index.dart';
import '../../routes/middlewares/ensure_auth_middleware.dart';
import '../../services/index.dart';
import '../announcement/index.dart';
import '../funds/index.dart';
import '../home/bindings.dart';
import '../home/view.dart';
import '../me/index.dart';
import '../promos/bindings.dart';
import '../promos/view.dart';
import '../../routes/app_pages.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../tutorial/tutorial.dart';

class Tab {
  final IconData icon;
  final String label;
  final String routeName;
  final Widget Function()? page;
  final Bindings binding;
  final List<GetMiddleware>? middlewares;
  final Key? tutorialKey;

  const Tab({this.tutorialKey, required this.icon, required this.label, required this.routeName, required this.page, required this.binding, this.middlewares});
}

class DashboardController extends GetxController {
  DashboardController();
  final currentIndex = 0.obs;
  final tabs = [
    Tab(icon: IconFont.qipaishi, label: "首页", routeName: Routes.home, page: () => const HomeView(), binding: HomeBinding()),
    Tab(icon: IconFont.liwu, label: "福利", tutorialKey: promosGuideKey, routeName: Routes.promos, page: () => const PromosView(), binding: PromosBinding()),
    Tab(icon: IconFont.qianbao, label: "钱包", tutorialKey: fundsGuideKey, routeName: Routes.funds, page: () => const FundsView(), binding: FundsBinding(), middlewares: [EnsureAuthMiddleware()]),
    Tab(icon: IconFont.yonghu, label: "我的", routeName: Routes.me, page: () => const MeView(), binding: MeBinding(), middlewares: [EnsureAuthMiddleware()]),
  ];

  void changePage(int index) {
    if (index > 1 && !AuthService.to.authenticated) {
      Get.toNamed(Routes.auth);
    } else {
      Get.toNamed(tabs[index].routeName, id: 1);
      currentIndex.value = index;
    }
  }

  Route? onGenerateRoute(RouteSettings settings) {
    final tab = tabs.firstWhereOrNull((item) => item.routeName == settings.name);

    if (tab == null) {
      return GetPageRoute(settings: settings, page: () => const SizedBox());
    }
    return GetPageRoute(settings: settings, page: tab.page, binding: tab.binding, transition: Transition.cupertino, middlewares: tab.middlewares);
  }

  @override
  void onReady() {
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   print("-----------------");
    //   debugPrint(Get.overlayContext.toString());
    //   showTutorial(Get.context!);
    // });

    super.onReady();
  }
}
