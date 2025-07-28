import 'package:app2/pages/dashboard/index.dart';
import 'package:app2/pages/funds/index.dart';
import 'package:app2/pages/funds/view.dart';
import 'package:app2/pages/home/index.dart';
import 'package:app2/pages/me/index.dart';
import 'package:app2/pages/me/view.dart';
import 'package:app2/pages/promos/index.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

// ignore: avoid_classes_with_only_static_members
class AppPages {
  static const INITIAL = Routes.DASHBOARD;

  static final routes = [
    GetPage(
      name: Routes.DASHBOARD,
      page: () => DashboardPage(),
      binding: DashboardBinding(),
      children: [
        GetPage(
          name: Routes.HOME,
          page: () => HomePage(),
          binding: HomeBinding(),
        ),
        GetPage(
          name: Routes.PROMOS,
          page: () => PromosPage(),
          binding: PromosBinding(),
        ),
        GetPage(
          name: Routes.FUNDS,
          page: () => FundsPage(),
          binding: FundsBinding(),
        ),
        GetPage(name: Routes.ME, page: () => MePage(), binding: MeBinding()),
      ],
    ),
  ];
}
