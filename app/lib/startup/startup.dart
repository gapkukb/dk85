import 'dart:async';

import 'package:app/helper/device_info.dart';
import 'package:app/i18n/index.dart';
import 'package:app/services/index.dart';
import 'package:app/shared/package_info/index.dart';
import 'package:app/startup/query_api_address.dart';
import 'package:app/storage/storage.dart';
import 'package:app_links/app_links.dart';
import 'package:flutter/services.dart';
import '../flavors.dart';

Future<void> startup() async {
  /// 初始化接口地址，本地缓存和包信息
  await Future.wait([backendApiManager.initialize(), Storage.initialize(), packageInfo.initialize()]);

  /// 初始化设备信息
  await Future.wait([deviceInfo.initialize()]);

  /// 初始化本地化
  i18n.initialize();

  /// 初始化services,内部会初始化用户信息（如果需要）
  await services.initialize();
  // services.initialize();

  Flavor.appFlavor = AppFlavor.values.firstWhere((element) => element.name == appFlavor);
  final appLinks = AppLinks();
  appLinks
    ..getInitialLink().then((link) {
      // 如果有值，处理启动时接收到的链接
      if (link != null) {
        print("Initial link: $link");
      }
    })
    ..uriLinkStream.listen((uri) {
      print("Received deep link: $uri");
    });
}
