import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'application.dart';
import 'bootstrap/bootstrap.dart';
import 'bootstrap/query_api_address.dart';
import 'helper/charles_monitor.dart';
import 'pages/splash/splash.dart';
import 'env.dart';

void main() async {
  if (Environment.isNotProd) {
    // HttpOverrides.global = CharlesProxyHttpOverride();
  }

  setupSystemUI();

  final errorMessage = Rxn<String>();

  /// 显示开屏页
  runApp(Obx(() => VicSplashPage(errorMessage.value)));

  await ApiBaseUrl.initialize(onError: (msg) => errorMessage.value = msg);

  await bootstrap();

  runApp(const Application());
}
