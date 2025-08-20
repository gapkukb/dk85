import 'package:flutter/material.dart';
import 'package:jjj/shared/refresh/refresh_header.dart';
import 'package:jjj/shared/reload/reload.dart';
import 'package:jjj/theme/light.theme.dart';
import 'package:jjj/views/home/home_view.dart';
import 'package:get/get.dart';
import 'package:jjj/views/login/login_view.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RefreshConfiguration(
      headerBuilder: () => BingoRefreshHead(),
      maxOverScrollExtent: 0,
      maxUnderScrollExtent: 0,
      child: GetMaterialApp(
        title: 'JJJ2',
        scrollBehavior: AppScrollBehavior(),
        theme: lightTheme,
        defaultTransition: Transition.cupertino,
        getPages: [GetPage(name: '/login', page: () => LoginView())],
        home: const HomeView(),
      ),
    );
  }
}

class AppScrollBehavior extends MaterialScrollBehavior {
  const AppScrollBehavior();

  // 统一物理效果：禁止回弹
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const ClampingScrollPhysics();
  }

  // 统一 Overscroll 指示器：使用 StretchingOverscrollIndicator
  @override
  Widget buildOverscrollIndicator(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) {
    return StretchingOverscrollIndicator(
      axisDirection: details.direction,
      child: child,
    );
  }
}
