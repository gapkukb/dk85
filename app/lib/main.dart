import 'dart:async';

import 'package:app/startup/startup.dart';
import 'package:app/views/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:scaled_app/scaled_app.dart';
import 'application.dart';

void main() async {
  ScaledWidgetsFlutterBinding.ensureInitialized(scaleFactor: (device) => device.width / 375);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  // 设置状态栏透明并防止状态栏变黑
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // 设置状态栏透明
      statusBarIconBrightness: Brightness.dark, // 设置状态栏图标颜色为深色
      systemNavigationBarColor: Colors.transparent, // 设置导航栏透明
      systemNavigationBarIconBrightness: Brightness.dark, // 设置导航栏图标颜色为深色
    ),
  );

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
    debugPrint(e.toString());
    rethrow;
  }
}
