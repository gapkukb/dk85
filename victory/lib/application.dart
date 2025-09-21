import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scaled_app/scaled_app.dart';
import 'pages/about/about.dart';
import 'pages/shell/shell.dart';
import 'routes/app_pages.dart';
import 'stores/stores.dart';
import 'startup/startup.dart';
import 'styles/styles.dart';
import 'translations/translations.dart';

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((a) {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).scale(),
      child: GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          splashFactory: NoSplash.splashFactory,
          scaffoldBackgroundColor: AppColor.background,
          appBarTheme: const AppBarTheme(
            backgroundColor: AppColor.background,
            elevation: 0,
            scrolledUnderElevation: 0,
          ),
          tabBarTheme: const TabBarThemeData(dividerHeight: 0),
          colorScheme: ColorScheme.fromSwatch(
            accentColor: AppColor.background,
            backgroundColor: AppColor.background,
            cardColor: AppColor.background,
            primarySwatch: MaterialColor(AppColor.primary.toARGB32(), {}),
          ),
        ),
        navigatorObservers: [BotToastNavigatorObserver()],
        locale: stores.app.locale.value,
        popGesture: false,
        translations: VicTranslations(),
        builder: startup,
        home: const ShellView(),
        getPages: AppPages.routes,
      ),
    );
  }
}
