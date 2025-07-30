import '../pages/deposit-receipt/view.dart';
import '../pages/favorites/view.dart';
import '../pages/more/view.dart';
import '/pages/customer-service/index.dart';
import '/pages/dashboard/index.dart';
import '/pages/deposit/index.dart';
import '/pages/funds/index.dart';
import '/pages/home/index.dart';
import '/pages/me/index.dart';
import '/pages/promos/index.dart';
import '/pages/withdrawal/index.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

// ignore: avoid_classes_with_only_static_members
class AppPages {
  static const INITIAL = Routes.DASHBOARD;

  static final routes = [
    GetPage(
      name: Routes.DASHBOARD,
      page: () => const DashboardPage(),
      binding: DashboardBinding(),
      children: [
        GetPage(
          name: Routes.HOME,
          page: () => const HomePage(),
          binding: HomeBinding(),
        ),
        GetPage(
          name: Routes.PROMOS,
          page: () => const PromosPage(),
          binding: PromosBinding(),
        ),
        GetPage(
          name: Routes.FUNDS,
          page: () => const FundsPage(),
          binding: FundsBinding(),
          preventDuplicates: true,
          children: [
            GetPage(
              name: Routes.DEPOSIT,
              page: () => const DepositView(),
              binding: DepositBinding(),
            ),
            GetPage(
              name: Routes.WITHDRAWAL,
              page: () => const WithdrawalView(),
              binding: WithdrawalBinding(),
            ),
          ],
        ),
        GetPage(
          name: Routes.ME,
          page: () => const MePage(),
          binding: MeBinding(),
        ),
      ],
    ),
    GetPage(
      name: Routes.CUSTOMER_SERVICE,
      page: () => const CustomerServiceView(),
      fullscreenDialog: true,
    ),
    GetPage(
      name: Routes.RECEIPT,
      page: () => const DepositReceiptView(),
      fullscreenDialog: true,
    ),
    GetPage(name: Routes.MORE, page: () => const MoreView()),
    GetPage(name: Routes.FAVORITES, page: () => const FavoritesPage()),
  ];
}
