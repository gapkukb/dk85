import 'dart:async';

import 'package:app/startup/startup.dart';
import 'package:app/views/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:scaled_app/scaled_app.dart';
import 'application.dart';

void main() async {
  ScaledWidgetsFlutterBinding.ensureInitialized(scaleFactor: (device) => device.width / 375);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  final error = false.obs;

  /// 显示开屏页
  runApp(Obx(() => SplashView(error.value, key: ValueKey(error))));

  try {
    /// 初始化各类对象并保证开屏页至少显示1秒
    await Future.wait([startup(), Future.delayed(Duration(seconds: 1))]);

    /// 显示真实页面
    runApp(const Application());
  } catch (e) {
    error.value = true;
  }
}
