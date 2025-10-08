import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:scaled_app/scaled_app.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:victory/application.dart';
import 'package:victory/bootstrap/query_api_address.dart';
import 'package:victory/constants/string.dart';
import 'package:victory/helper/charles_monitor.dart';
import 'package:victory/helper/native_image.dart';
import 'package:victory/helper/system_ui.dart';
import 'package:victory/pages/splash/splash.dart';
import 'package:victory/services/services.dart';
import 'package:victory/shared/app_info/app_info.dart';
import 'package:victory/shared/talker/talker.dart';
import 'package:victory/storage/storage.dart';

void main() async {
  final errorMessage = Rxn<String>();
  SystemUIHelper.ensureInitialized();
  await NativeImage.ensureInitialized();
  await Storage.ensureInitialized();
  await VicAppInfo.shared.ensureInitialized();

  /// 显示开屏页
  runApp(Obx(() => VicSplashPage(errorMessage.value)));

  await CharlesProxyHttpOverride.ensureInitialized();
  await ApiBaseUrl.ensureInitialized(onError: (msg) => errorMessage.value = msg);
  await services.ensureInitialized();

  await SentryFlutter.init(
    (options) {
      options
        ..dsn = 'https://63d3202e1e765771612554021f32fed7@o4508130651144192.ingest.de.sentry.io/4508130653175888'
        ..release = VicAppInfo.shared.packageName
        ..sampleRate = kDebugMode ? 0 : null
        ..debug = kDebugMode
        ..enablePrintBreadcrumbs = false;
    },
    // Init your App.
    appRunner: () => runApp(const Application()),
  );
}

/// 过滤 StackTrace，只保留 lib/ 下的条目
_customPrint(Object error, StackTrace? stack) {
  if (error.toString() == cancelTextConst) return;

  final s =
      '$error\n${(stack ?? '').toString().split('\n').where((line) => line.contains('package:victory')) // 可选更严格路径过滤
      .toList().join('\n')}';

  talker.error(s);
}
