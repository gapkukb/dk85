import 'dart:async';

import 'package:app/helper/device_info.dart';
import 'package:app/i18n/index.dart';
import 'package:app/services/index.dart';
import 'package:app/shared/package_info/index.dart';
import 'package:app/storage/storage.dart';
import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scaled_app/scaled_app.dart';

import 'application.dart';
import 'flavors.dart';

void main() async {
  ScaledWidgetsFlutterBinding.ensureInitialized(scaleFactor: (device) => device.width / 375);
  // runApp(const SplashView());
  // await Future.delayed(Duration(seconds: 3));

  await Future.wait([
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]),
    Storage.initialize(),
    packageInfo.initialize(),
  ]);

  await Future.wait([deviceInfo.setup()]);

  i18n.setup();
  initializeServices();
  Flavor.appFlavor = AppFlavor.values.firstWhere((element) => element.name == appFlavor);
  final appLinks = AppLinks();
  appLinks
    ..getInitialLink().then((link) {
      // 如果有值，处理启动时接收到的链接
      if (link != null) {
        print("Initial link: $link");
      }
    })
    ..uriLinkStream.listen((uri) {
      print("Received deep link: $uri");
    });
  runApp(const Application());
}
