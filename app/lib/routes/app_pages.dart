import 'package:get/get.dart';
import '../pages/_root/index.dart';
import '../pages/demo/demo.dart';
import '/pages/searching/index.dart';
import '../pages/auth/auth.dart';
import '/pages/confirmation/index.dart';
import '/pages/records/index.dart';
import '/pages/records_funds_detail/index.dart';
import '/pages/withdrawal_account/index.dart';
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
import '/pages/withdrawal/index.dart';
import 'middlewares/ensure_auth_middleware.dart';

part 'app_routes.dart';

// ignore: avoid_classes_with_only_static_members
class AppPages {
  static const INITIAL = Routes.dashboard;

  static final routes = [
    GetPage(name: Routes.spalash, page: () => const SpalashView()),
    GetPage(
      name: Routes.dashboard,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
      preventDuplicates: true,
      children: [
        GetPage(name: Routes.demo, page: () => const DemoView()),
        GetPage(name: Routes.home, page: () => const HomeView(), binding: HomeBinding()),
        GetPage(name: Routes.promos, page: () => const PromosView(), binding: PromosBinding(), middlewares: [EnsureAuthMiddleware()]),
        GetPage(
          name: Routes.funds,
          page: () => const FundsView(),
          binding: FundsBinding(),
          preventDuplicates: true,
          middlewares: [EnsureAuthMiddleware()],
          children: [
            GetPage(name: Routes.deposit, page: () => const DepositView(), binding: DepositBinding()),
            GetPage(name: Routes.withdrawal, page: () => const WithdrawalView(), binding: WithdrawalBinding()),
          ],
        ),
        GetPage(name: Routes.me, page: () => const MeView(), binding: MeBinding()),
      ],
    ),
    GetPage(name: Routes.confirmation, page: () => const ConfirmationView()),
    GetPage(name: Routes.withdrawalAccount, page: () => const WithdrawalAccountView(), binding: WithdrawalAccountBinding()),
    GetPage(name: Routes.records, page: () => const RecordsView(), binding: RecordsBinding()),
    GetPage(name: Routes.customerService, page: () => const CustomerServiceView(), fullscreenDialog: true, transition: Transition.cupertino),
    GetPage(name: Routes.receipt, page: () => const DepositReceiptView(), fullscreenDialog: true),
    GetPage(name: Routes.more, page: () => const MoreView()),
    GetPage(name: Routes.favorites, page: () => const FavoritesView()),
    GetPage(name: Routes.inbox, page: () => const InboxView(), binding: InboxBinding()),
    GetPage(name: Routes.settings, page: () => const SettingsView()),
    GetPage(name: Routes.updatePasswrod, page: () => const UpdatePasswordView()),
    GetPage(name: Routes.compeleteProfile, page: () => const CompeleteProfileView(), fullscreenDialog: true, opaque: true),
    GetPage(name: Routes.recordsFundsDetail, page: () => const RecordsFundsDetailView()),
    GetPage(name: Routes.auth, page: () => const AccountView(), fullscreenDialog: true, transition: Transition.cupertino),
    GetPage(name: Routes.search, page: () => const SearchingView(), binding: SearchingBinding()),
    GetPage(name: Routes.search, page: () => const SearchingView(), binding: SearchingBinding()),
  ];
}
