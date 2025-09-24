import 'dart:async';
import 'dart:io';
import '../env.dart';
import '../shared/logger/logger.dart';
import '../storage/storage.dart';

class CharlesProxyHttpOverride extends HttpOverrides {
  static late final String host;
  static late final int port;
  static String get uri => Uri(host: host, port: port).toString();
  static bool debug = false;

  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..findProxy = (uri) {
        return "PROXY $uri";
      }
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }

  static Future ensureInitialized() async {
    // 生产环境不开启
    // TODO:生产环境条件开启;

    if (Environment.isProd) return;
    if (storage.proxyHost.value == null || storage.proxyPort.value == null) return;
    host = storage.proxyHost.value!;
    port = storage.proxyPort.value!;
    storage
      ..proxyHost.clear()
      ..proxyPort.clear();

    Logger.debug('检测到charles设置，开始配置代理...');
    // 非生产环境尝试开启
    await detect(host, port);
    Logger.debug('代理成功{$uri}');
    HttpOverrides.global = CharlesProxyHttpOverride();
    debug = true;
  }

  static Future detect(String host, int port) async {
    final request = HttpClient()..connectionTimeout = const Duration(seconds: 1);
    return await request.head(host, port, '/').whenComplete(() => request.close(force: true));
  }
}
