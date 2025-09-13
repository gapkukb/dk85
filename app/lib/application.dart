import 'package:app/dialogs/dialogs.dart';
import 'package:app/flavors.dart';
import 'package:app/i18n/index.dart';
import 'package:app/views_modal/guide/guide.dart';
import 'package:app/routes/app_pages.dart';
import 'package:app/services/index.dart';
import 'package:app/setup/easyloading.dart';
import 'package:app/storage/storage.dart';
import 'package:app/widgets/loading/loading.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:app/theme/index.dart';
import 'package:app/views/home/home_view.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:scaled_app/scaled_app.dart';
import 'package:skeletonizer/skeletonizer.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    double textScaler = 1.0;
    if (I18n.locale?.languageCode == I18n.my_MM.languageCode) {
      textScaler = 0.95;
    }
    return RefreshConfiguration(
      headerBuilder: () => WaterDropMaterialHeader(backgroundColor: AppColors.background, color: AppColors.highlight, distance: 40),
      // footerBuilder: () => CustomFooter(
      //   builder: (context, mode) {
      //     final List<Widget> children = [];
      //     final style = TextStyle(fontSize: 12, color: AppColors.description);
      //     if (mode == LoadStatus.noMore) {
      //       final divider = Expanded(child: Divider(color: AppColors.e1e1e1, thickness: 1, indent: 12, endIndent: 12, height: 1));
      //       children.addAll([divider, Text('No more', style: style), divider]);
      //     } else {
      //       children.addAll([SizedBox.square(dimension: 48, child: loadingWidget), Text('loading more...', style: style)]);
      //     }
      //     return Center(
      //       child: Row(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: children),
      //     );
      //   },
      //   height: 36,
      //   onOffsetChange: (offset) {},
      //   loadStyle: LoadStyle.ShowWhenLoading,
      // ),
      footerBuilder: () => ClassicFooter(),
      springDescription: SpringDescription.withDurationAndBounce(bounce: 0),
      maxOverScrollExtent: 0,
      maxUnderScrollExtent: 0,
      bottomHitBoundary: 0,
      child: MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(textScaler)).scale(),
        child: GetMaterialApp(
          builder: (context, child) {
            WidgetsBinding.instance.addPostFrameCallback((_) async {
              // 显示引导浮层
              if (services.auth.authorized) {
                await showGuide();
              }
              registerDialogs();
              Dialogs.to.active();
              services.user.queryActivity();
            });
            return setupBotToast(context, child!);
          },
          navigatorObservers: [BotToastNavigatorObserver()],
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
          routingCallback: Dialogs.to.onRouteChanged,
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
