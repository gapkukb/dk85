import 'dart:async';
import 'dart:io';
import 'package:victory/env.dart';
import 'package:victory/shared/logger/logger.dart';
import 'package:victory/storage/storage.dart';

class CharlesProxyHttpOverride extends HttpOverrides {
  static final String host = '192.168.254.112';
  static final int port = 8888;
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

    // if (Environment.isProd) return;
    // if (storage.proxyHost.value == null || storage.proxyPort.value == null) return;
    // host = storage.proxyHost.value ?? '192.168.254.112';
    // port = storage.proxyPort.value ?? 8888;
    // host = '192.168.254.112';
    // port = 8888;
    // storage
    //   ..proxyHost.clear()
    //   ..proxyPort.clear();

    Logger.debug('检测到charles设置，开始配置代理...');
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
    final request = HttpClient()..connectionTimeout = const Duration(seconds: 1);
    return await request.head(host, port, '').whenComplete(() => request.close(force: true));
  }
}
