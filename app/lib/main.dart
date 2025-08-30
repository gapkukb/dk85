import 'dart:async';

import 'package:app/helper/device_info.dart';
import 'package:app/i18n/index.dart';
import 'package:app/services/index.dart';
import 'package:app/shared/package_info/index.dart';
import 'package:app/storage/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:scaled_app/scaled_app.dart';

import 'application.dart';
import 'flavors.dart';

void main() async {
  ScaledWidgetsFlutterBinding.ensureInitialized(
    scaleFactor: (device) => device.width / 375,
  );
  // runApp(const SplashView());
  // await Future.delayed(Duration(seconds: 3));

  await Future.wait([
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]),
    Storage.setup(),
    packageInfo.setup(),
  ]);

  await Future.wait([deviceInfo.setup()]);

  i18n.setup();
  setupServices();
  Flavor.appFlavor = AppFlavor.values.firstWhere(
    (element) => element.name == appFlavor,
  );

  runApp(const Application());
}
