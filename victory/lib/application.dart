import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scaled_app/scaled_app.dart';
import 'pages/about/about.dart';
import 'pages/shell/shell.dart';
import 'routes/app_pages.dart';
import 'stores/stores.dart';
import 'startup/startup.dart';
import 'theme/theme.dart';
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
          scaffoldBackgroundColor: AppColors.background,
          appBarTheme: const AppBarTheme(
            backgroundColor: AppColors.background,
            elevation: 0,
            scrolledUnderElevation: 0,
          ),
          tabBarTheme: const TabBarThemeData(dividerHeight: 0),
          colorScheme: ColorScheme.fromSwatch(
            accentColor: AppColors.background,
            backgroundColor: AppColors.background,
            cardColor: AppColors.background,
            primarySwatch: MaterialColor(AppColors.primary.toARGB32(), {}),
          ),
        ),
        initialRoute: AppPages.INITIAL,
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
