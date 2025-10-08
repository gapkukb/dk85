import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:victory/env.dart';
import 'package:victory/shared/logger/logger.dart';
import 'package:victory/storage/storage.dart';

class CharlesProxyHttpOverride extends HttpOverrides {
  static String? host;
  static int? port;
  static bool debug = false;

  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..findProxy = (uri) {
        return "PROXY $host:$port";
      }
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }

  static Future ensureInitialized() async {
    if (kDebugMode) {
      host = '192.168.254.112';
      port = 8888;
    } else {
      if (storage.proxyHost.value != null) {
        host = storage.proxyHost.value!;
        storage.proxyHost.clear();
      }

      if (storage.proxyPort.value != null) {
        port = storage.proxyPort.value!;
        storage.proxyPort.clear();
      }
    }

    if (host == null || port == null) return;

    Logger.debug('开始配置代理...$host:$port');
    try {
      // 非生产环境尝试开启
      await detect(host!, port!);
      Logger.debug('代理成功{ $host:$port }');
      HttpOverrides.global = CharlesProxyHttpOverride();
      debug = true;
    } catch (e) {
      Logger.error('代理失败{ $host:$port }');
    }
  }

  static Future detect(String host, int port) async {
    final request = HttpClient()..connectionTimeout = const Duration(seconds: 1);
    return await request.get(host, port, '').whenComplete(() => request.close(force: true));
  }
}
