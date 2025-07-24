part of 'index.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetRouterOutlet.builder(
      route: Routes.home,
      builder: (context) {
        return Scaffold(
          body: GetRouterOutlet(
            initialRoute: Routes.dashboard,
            anchorRoute: Routes.home,
          ),
          bottomNavigationBar: IndexedRouteBuilder(
            routes: const [
              Routes.dashboard,
              Routes.promos,
              Routes.wallet,
              Routes.profile,
            ],
            builder: (context, routes, index) {
              final delegate = context.delegate;
              return BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                currentIndex: index,
                selectedFontSize: 10,
                unselectedFontSize: 10,
                onTap: (value) {
                  delegate.toNamed(routes[value]);
                },
                selectedItemColor: AppColor.main,
                items: [
                  // _Paths.HOME + [Empty]
                  BottomNavigationBarItem(
                    icon: Iconify(
                      Arcticons.pokerstars,
                      color: index == 0 ? AppColor.main : null,
                    ),
                    label: '首页',
                  ),
                  // _Paths.HOME + Routes.PROMOS
                  BottomNavigationBarItem(
                    icon: Iconify(
                      Ph.gift_light,
                      color: index == 1 ? AppColor.main : null,
                    ),
                    label: '福利',
                  ),
                  // _Paths.HOME + Routes.PROFILE
                  BottomNavigationBarItem(
                    icon: Iconify(
                      La.wallet,
                      color: index == 2 ? AppColor.main : null,
                    ),
                    label: '钱包',
                  ),
                  // _Paths.HOME + _Paths.PRODUCTS
                  BottomNavigationBarItem(
                    icon: Iconify(
                      MaterialSymbols.account_circle_outline,
                      color: index == 3 ? AppColor.main : null,
                    ),
                    label: '我的',
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
