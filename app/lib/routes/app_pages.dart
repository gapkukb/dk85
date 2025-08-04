import 'package:get/get.dart';
import '/pages/spalash/index.dart';
import '/pages/complete_profile/index.dart';
import '/pages/deposit-receipt/view.dart';
import '/pages/favorites/view.dart';
import '/pages/inbox/index.dart';
import '/pages/settings/index.dart';
import '/pages/update-password/index.dart';
import '/pages/more/view.dart';
import '/pages/customer-service/index.dart';
import '/pages/dashboard/index.dart';
import '/pages/deposit/index.dart';
import '/pages/funds/index.dart';
import '/pages/home/index.dart';
import '/pages/me/index.dart';
import '/pages/promos/index.dart';
import '/pages/announcement/index.dart';
import '/pages/withdrawal/index.dart';

part 'app_routes.dart';

// ignore: avoid_classes_with_only_static_members
class AppPages {
  static const INITIAL = Routes.DASHBOARD;

  static final routes = [
    GetPage(name: Routes.SPALASH, page: () => const SpalashView()),
    GetPage(name: Routes.ANNOUNCEMENT, page: () => const AnnouncementView(), opaque: true),
    GetPage(
      name: Routes.DASHBOARD,
      page: () => const DashboardPage(),
      binding: DashboardBinding(),
      children: [
        GetPage(name: Routes.HOME, page: () => const HomeView(), binding: HomeBinding()),
        GetPage(name: Routes.PROMOS, page: () => const PromosPage(), binding: PromosBinding()),
        GetPage(
          name: Routes.FUNDS,
          page: () => const FundsPage(),
          binding: FundsBinding(),
          preventDuplicates: true,
          children: [
            GetPage(name: Routes.DEPOSIT, page: () => const DepositView(), binding: DepositBinding()),
            GetPage(name: Routes.WITHDRAWAL, page: () => const WithdrawalView(), binding: WithdrawalBinding()),
          ],
        ),
        GetPage(name: Routes.ME, page: () => const MePage(), binding: MeBinding()),
      ],
    ),
    GetPage(name: Routes.CUSTOMER_SERVICE, page: () => const CustomerServiceView(), fullscreenDialog: true),
    GetPage(name: Routes.RECEIPT, page: () => const DepositReceiptView(), fullscreenDialog: true),
    GetPage(name: Routes.MORE, page: () => const MoreView()),
    GetPage(name: Routes.FAVORITES, page: () => const FavoritesPage()),
    GetPage(name: Routes.INBOX, page: () => const InboxView(), binding: InboxBinding()),
    GetPage(name: Routes.SETTINGS, page: () => const SettingsView()),
    GetPage(name: Routes.UPDATE_PASSWROD, page: () => const UpdatePasswordView()),
    GetPage(name: Routes.COMPELETE_PROFILE, page: () => const CompeleteProfileView(), fullscreenDialog: true, opaque: true),
  ];
}
