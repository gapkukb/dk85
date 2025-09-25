import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:victory/application.dart';
import 'package:victory/bootstrap/bootstrap.dart';
import 'package:victory/bootstrap/query_api_address.dart';
import 'package:victory/pages/splash/splash.dart';
import 'package:victory/shared/talker/talker.dart';

void main() async {
  runZonedGuarded(
    () async {
      setupSystemUI();
      final errorMessage = Rxn<String>();

      /// 显示开屏页
      runApp(Obx(() => VicSplashPage(errorMessage.value)));

      await ApiBaseUrl.ensureInitialized(onError: (msg) => errorMessage.value = msg);

      await bootstrap();

      runApp(const Application());
    },
    (error, stack) {
      talker.error(error, {error: error, stack: stack});
    },
  );
}
