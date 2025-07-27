part of './index.dart';

class AppPages {
  AppPages._();

  static final initial = Routes.userAccount;

  static final routes = [
    GetPage(
      name: '/',
      page: () => RootView(),
      binding: RootBinding(),
      participatesInRootNavigator: true,
      preventDuplicates: true,
      children: [
        GetPage(
          name: _Paths.home,
          page: () => HomeView(),
          binding: HomeBinding(),
          preventDuplicates: true,
          children: [
            GetPage(
              name: _Paths.dashboard,
              page: () => DashboardView(),
              binding: DashboardBinding(),
            ),
            GetPage(
              name: _Paths.promos,
              page: () => PromosView(),
              binding: PromosBinding(),
            ),
            GetPage(
              name: _Paths.wallet,
              page: () => WalletView(),
              binding: WalletBinding(),
              // preventDuplicates: true,
              // participatesInRootNavigator: true,
              // children: [
              //   GetPage(
              //     name: _Paths.deposit,
              //     page: () => DepositView(),
              //     binding: DepositBinding(),
              //   ),
              //   GetPage(
              //     name: _Paths.withdrawal,
              //     page: () => WithdrawalView(),
              //     binding: WithdrawalBinding(),
              //   ),
              // ],
            ),
            GetPage(
              name: _Paths.profile,
              page: () => ProfileView(),
              binding: ProfileBinding(),
            ),
          ],
        ),
      ],
    ),
    GetPage(
      name: _Paths.funds,
      page: () => FundsView(),
      binding: FundsBinding(),
    ),
    GetPage(
      name: _Paths.customerService,
      page: () => CustomeServiceView(),
      // binding: CustomerServiceBinding(),
    ),
    GetPage(name: _Paths.userAccount, page: () => UserAccount()),
    GetPage(
      name: _Paths.completeProfile,
      page: () => CompleteProfileView(),
      binding: CompleteProfileBinding(),
      fullscreenDialog: true,
      alignment: Alignment.center,
      opaque: true,
    ),
  ];
}
