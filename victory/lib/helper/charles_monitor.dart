import 'dart:async';
import 'dart:io';
import 'package:victory/env.dart';
import 'package:victory/shared/logger/logger.dart';
import 'package:victory/storage/storage.dart';

class CharlesProxyHttpOverride extends HttpOverrides {
  static String host = '192.168.254.112';
  static int port = 8888;
  static String get proxyUri => Uri(host: host, port: port).toString();
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
    // 生产环境不开启
    if (storage.proxyHost.value != null) {
      host = storage.proxyHost.value!;
    }

    if (storage.proxyPort.value != null) {
      port = storage.proxyPort.value!;
    }

    storage
      ..proxyHost.clear()
      ..proxyPort.clear();

    Logger.debug('开始配置代理...$host:$port');
    try {
      // 非生产环境尝试开启
      await detect(host, port);
      Logger.debug('代理成功{$proxyUri}');
      HttpOverrides.global = CharlesProxyHttpOverride();
      debug = true;
    } catch (e) {
      Logger.error('代理失败{$proxyUri}');
    }
  }

  static Future detect(String host, int port) async {
    final request = HttpClient()..connectionTimeout = const Duration(seconds: 10);
    return await request
        .get('192.168.254.112', 8888, '')
        .then((e) {
          return e;
        })
        .whenComplete(() => request.close(force: true));
  }
}
