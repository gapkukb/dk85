import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scaled_app/scaled_app.dart';
import 'pages/about/about.dart';
import 'pages/shell/shell.dart';
import 'routes/app_pages.dart';
import 'shared/app_info/app_info.dart';
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
        title: VicAppInfo.shared.appName,
        theme: lightTheme,
        themeMode: ThemeMode.light,
        initialRoute: AppPages.INITIAL,
        navigatorObservers: [BotToastNavigatorObserver()],
        locale: stores.app.locale.value,
        popGesture: false,
        translations: VicTranslations(),
        builder: startup,
        home: const VicShellView(),
        getPages: AppPages.routes,
      ),
    );
  }
}
