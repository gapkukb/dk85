import 'package:easy_refresh/easy_refresh.dart';
import 'package:get/get.dart';

import 'app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scaled_app/scaled_app.dart';
import 'shared/package_info/index.dart';
import 'i18n/index.dart';
import 'services/index.dart';
import 'shared/pull_up_indicator/index.dart';
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
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light));
  i18n.setup();
  setupServices();
  EasyRefresh.defaultFooterBuilder = () => pullUpIndicator;
  runApp(const Application());
}
