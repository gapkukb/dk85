import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scaled_app/scaled_app.dart';
import '/theme/index.dart';
import 'observers/route_observer.dart';
import 'setup/easyloading.dart';
import 'shared/reload/reload.dart';
import '/i18n/index.dart';
import '/routes/app_pages.dart';
import '/shared/logger/logger_utils.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).scale(),
      child: GetMaterialApp(
        builder: setupBotToast(),
        navigatorObservers: [AppRouteObserver()],
        key: appKey,
        initialRoute: AppPages.INITIAL,
        // debugShowCheckedModeBanner: false,
        enableLog: true,
        logWriterCallback: Logger.write,
        title: "DK85",
        getPages: AppPages.routes,
        locale: I18n.locale,
        fallbackLocale: I18n.fallbackLocale,
        translations: i18n,
        theme: lightTheme,
        defaultTransition: Transition.cupertino,
      ),
    );
  }
}
