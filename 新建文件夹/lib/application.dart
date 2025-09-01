import 'package:app/flavors.dart';
import 'package:app/i18n/index.dart';
import 'package:app/routes/app_pages.dart';
import 'package:app/setup/easyloading.dart';
import 'package:flutter/material.dart';
import 'package:app/shared/refresh/refresh_header.dart';
import 'package:app/theme/index.dart';
import 'package:app/views/home/home_view.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:scaled_app/scaled_app.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RefreshConfiguration(
      headerBuilder: () => BingoRefreshHead(),
      maxOverScrollExtent: 0,
      // maxUnderScrollExtent: 0,
      child: MediaQuery(
        data: MediaQuery.of(context).scale(),
        child: GetMaterialApp(
          builder: setupBotToast(),
          title: Flavor.title,
          scrollBehavior: AppScrollBehavior(),
          theme: lightTheme,
          defaultTransition: Transition.cupertino,
          locale: I18n.locale,
          fallbackLocale: I18n.fallbackLocale,
          translations: i18n,
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          home: const HomeView(),
        ),
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
