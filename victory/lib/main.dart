import 'dart:io';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:scaled_app/scaled_app.dart';
import 'application.dart';
import 'bootstrap/query_api_address.dart';
import 'env.dart';
import 'helper/charles_monitor.dart';
import 'pages/splash/splash.dart';
import 'stores/stores.dart';
import 'storage/storage.dart';

void main() async {
  initializeUI();

  if (Environment.isNotProd) {
    HttpOverrides.global = CharlesProxyHttpOverride();
  }

  final errorMessage = Rxn<String>();

  /// 显示开屏页
  runApp(Obx(() => SplashPage(errorMessage.value)));

  await ApiBaseUrl.initialize(onError: (msg) => errorMessage.value = msg);

  await Storage.initialize();

  await stores.initialize();

  runApp(const Application());
}

void initializeUI() {
  ScaledWidgetsFlutterBinding.ensureInitialized(
    scaleFactor: (deviceSize) => deviceSize.width / 375,
  );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  // 设置状态栏透明并防止状态栏变黑
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // 设置状态栏透明
      statusBarIconBrightness: Brightness.dark, // 设置状态栏图标颜色为深色
      systemNavigationBarColor: Colors.transparent, // 设置导航栏透明
      systemNavigationBarIconBrightness: Brightness.dark, // 设置导航栏图标颜色为深色
    ),
  );
}
