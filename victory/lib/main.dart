import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:scaled_app/scaled_app.dart';
import 'package:victory/application.dart';
import 'package:victory/bootstrap/bootstrap.dart';
import 'package:victory/bootstrap/query_api_address.dart';
import 'package:victory/constants/string.dart';
import 'package:victory/helper/native_image.dart';
import 'package:victory/pages/splash/splash.dart';
import 'package:victory/shared/talker/talker.dart';

void main() async {
  // 捕获 Flutter 框架错误
  FlutterError.onError = (FlutterErrorDetails details) {
    // FlutterError.dumpErrorToConsole(details);
    // 只打印 lib/ 下的堆栈
    customPrint(details.exception, details.stack);
  };
  runZonedGuarded(
    () async {
      setupSystemUI();
      await NativeImage.ensureInitialized();
      final errorMessage = Rxn<String>();

      /// 显示开屏页
      runApp(Obx(() => VicSplashPage(errorMessage.value)));

      await ApiBaseUrl.ensureInitialized(onError: (msg) => errorMessage.value = msg);

      await bootstrap();

      runApp(const Application());
    },
    customPrint,
  );
}

/// 过滤 StackTrace，只保留 lib/ 下的条目
customPrint(Object error, StackTrace? stack) {
  if (error.toString() == cancelTextConst) return;

  final s =
      '$error\n${(stack ?? '').toString().split('\n').where((line) => line.contains('package:victory')) // 可选更严格路径过滤
      .toList().join('\n')}';

  talker.error(s);
}
