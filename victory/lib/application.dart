import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scaled_app/scaled_app.dart';
import 'package:victory/modals/modals.dart';
import 'package:victory/pages/shell/shell.dart';
import 'package:victory/routes/app_pages.dart';
import 'package:victory/shared/app_info/app_info.dart';
import 'package:victory/services/services.dart';
import 'package:victory/startup/startup.dart';
import 'package:victory/theme/theme.dart';
import 'package:victory/translations/translations.dart';

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((a) {
      VicModals.shared.resume();
    });
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
        defaultTransition: Transition.cupertino,
        locale: services.app.locale.value,
        popGesture: false,
        translations: VicTranslations(),
        builder: startup,
        home: const VicShellView(),
        getPages: AppPages.routes,
      ),
    );
  }
}
