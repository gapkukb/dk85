import 'dart:async';

import 'package:app/helper/device_info.dart';
import 'package:app/i18n/index.dart';
import 'package:app/services/index.dart';
import 'package:app/shared/package_info/index.dart';
import 'package:app/startup/query_api_address.dart';
import 'package:app/storage/storage.dart';

Future<void> startup() async {
  /// 初始化接口地址，本地缓存和包信息

  final [apiAddress as String] = await Future.wait([queryApiAddress(), Storage.initialize(), packageInfo.initialize()]);

  /// 初始化设备信息
  await Future.wait([deviceInfo.setup()]);

  /// 初始化本地化
  i18n.initialize();

  /// 初始化services
  Services.initialize();
}
