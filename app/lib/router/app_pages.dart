part of './index.dart';

class AppPages {
  AppPages._();

  static final initial = Routes.home;
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
  ];
}
