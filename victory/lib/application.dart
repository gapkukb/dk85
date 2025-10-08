import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:scaled_app/scaled_app.dart';
import 'package:victory/apis/apis.dart';
import 'package:victory/env.dart';
import 'package:victory/helper/toast.dart';
import 'package:victory/mixins/locale.mixin.dart';
import 'package:victory/modals/modals.dart';
import 'package:victory/pages/shell/shell.dart';
import 'package:victory/routes/app_pages.dart';
import 'package:victory/shared/app_info/app_info.dart';
import 'package:victory/services/services.dart';
import 'package:victory/startup/bot_toast.dart';
import 'package:victory/startup/guide/guide.dart';
import 'package:victory/theme/theme.dart';
import 'package:victory/translations/translations.dart';

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  Widget build(BuildContext context) {
    double textScaler = 1.0;
    if (services.app.locale.value == VicLocaleMixin.my) {
      textScaler = 0.95;
    }
    return RefreshConfiguration(
      headerBuilder: () => const WaterDropMaterialHeader(backgroundColor: AppColors.background, color: AppColors.highlight, distance: 40),
      footerBuilder: () => const ClassicFooter(),
      springDescription: SpringDescription.withDurationAndBounce(bounce: 0),
      maxOverScrollExtent: 0,
      maxUnderScrollExtent: 0,
      bottomHitBoundary: 0,
      child: MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(textScaler)).scale(),
        child: GetMaterialApp(
          title: VicAppInfo.shared.appName,
          theme: lightTheme,
          themeMode: ThemeMode.light,
          initialRoute: AppPages.INITIAL,
          navigatorObservers: [BotToastNavigatorObserver()],
          defaultTransition: Transition.cupertino,
          locale: services.app.locale.value,
          onReady: () async {
            await showGuide();
            VicModals.shared.resume();
          },
          scrollBehavior: const AppScrollBehavior(),
          translations: VicTranslations(),
          builder: setupBotToast,
          home: const VicShellView(),
          getPages: AppPages.routes,
          routingCallback: services.app.onRouting,
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
  Widget buildOverscrollIndicator(BuildContext context, Widget child, ScrollableDetails details) {
    return StretchingOverscrollIndicator(axisDirection: details.direction, child: child);
  }
}
