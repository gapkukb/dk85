import 'dart:async';

import 'package:app/services/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'application.dart';
import 'flavors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // runApp(const SplashView());
  // await Future.delayed(Duration(seconds: 3));
  setupServices();
  Flavor.appFlavor = AppFlavor.values.firstWhere(
    (element) => element.name == appFlavor,
  );

  runApp(const Application());
}
