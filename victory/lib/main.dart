import 'package:flutter/material.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'application.dart';
import 'bootstrap/bootstrap.dart';
import 'bootstrap/query_api_address.dart';
import 'pages/splash/splash.dart';

void main() async {
  setupSystemUI();

  final errorMessage = Rxn<String>();

  /// 显示开屏页
  runApp(Obx(() => VicSplashPage(errorMessage.value)));

  await ApiBaseUrl.ensureInitialized(onError: (msg) => errorMessage.value = msg);

  await bootstrap();

  runApp(const Application());
}
