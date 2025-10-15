import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/helper/ota_updater_popup.dart';
import 'package:flutter_application_2/pages/shell/image_editor.dart';
import 'package:flutter_application_2/pages/shell/shell.dart';
import 'package:flutter_application_2/pages/splash/splash.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

late final PackageInfo packageInfo;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // runApp(const Splash());
  // await Future.delayed(Duration.zero);
  // BotToast.showText(text: 'xxxxxxxxxxxxxx');
  packageInfo = await PackageInfo.fromPlatform();
  await Future.delayed(Duration(seconds: 3));
  runApp(const MyApp());
  // BotToast.showText(text: 'yyyyyyyyyyyyy');
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    Future.microtask(() {
      Get.dialog(OtaUpdaterPopup(isForce: true), barrierDismissible: false);
    });
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      color: Colors.amber,
      title: packageInfo.appName,
      navigatorObservers: [BotToastNavigatorObserver()],
      // initialRoute: '/splash',
      builder: BotToastInit(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Shell(),
      getPages: [
        GetPage(name: '/splash', page: () => Splash()),
        GetPage(
          name: '/avatar_image',
          page: () => ImageEditor2(),
          fullscreenDialog: true, // This is the key property
          transition: Transition.downToUp, // Optional: for animation
          transitionDuration: Duration(milliseconds: 300), // Optional
        ),
      ],
    );
  }
}
