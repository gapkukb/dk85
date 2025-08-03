import 'app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scaled_app/scaled_app.dart';
import 'shared/package_info/index.dart';
import 'i18n/index.dart';
import 'services/index.dart';
import 'storage/index.dart';

void main() async {
  ScaledWidgetsFlutterBinding.ensureInitialized(
    scaleFactor: (deviceSize) {
      const double designWidth = 375.0;
      return deviceSize.width / designWidth;
    },
  );

  await Future.wait([
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]),
    setupPackageInfo(),
    storage.setup(),
  ]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.white, statusBarIconBrightness: Brightness.light));
  i18n.setup();
  setupServices();

  runApp(const Application());
}
