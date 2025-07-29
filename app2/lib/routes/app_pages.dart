import '../pages/deposit-receipt/view.dart';
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
          preventDuplicates: true,
          children: [
            GetPage(
              name: Routes.DEPOSIT,
              page: () => DepositView(),
              binding: DepositBinding(),
            ),
            GetPage(
              name: Routes.WITHDRAWAL,
              page: () => WithdrawalView(),
              binding: WithdrawalBinding(),
            ),
          ],
        ),
        GetPage(name: Routes.ME, page: () => MePage(), binding: MeBinding()),
      ],
    ),
    GetPage(
      name: Routes.CUSTOMER_SERVICE,
      page: () => CustomerServiceView(),
      fullscreenDialog: true,
    ),
    GetPage(
      name: Routes.RECEIPT,
      page: () => DepositReceiptView(),
      fullscreenDialog: true,
    ),
  ];
}
