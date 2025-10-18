import 'package:dio/dio.dart';
import 'package:encrypt/encrypt.dart';
import 'package:flutter/foundation.dart' as f;
import 'package:victory/apis/apis.dart';
import 'package:victory/helper/crypto.dart';
import 'package:victory/shared/talker/talker.dart';

List<String> _parse(String source) {
  final key = Key.fromUtf8(VicCryptoHelper.base64.decode("YXNkZmxAc2ZnYUhzOCNhYQ=="));
  final iv = IV.fromUtf8(VicCryptoHelper.base64.decode('amFzbGtmeGpAYWYjM0hzOA=='));

  final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
  Encrypted encryptedFromBase64 = Encrypted.fromBase64(source);
  String decryptedText = encrypter.decrypt(encryptedFromBase64, iv: iv);
  return decryptedText.split("\n");
}

Future<String?> _query() async {
  if (!f.kReleaseMode) {
    return "https://mdgametest.xyz";
  }
  final urls = [
    "aHR0cHM6Ly9tZC1idXNpbmVzcy1wcmQub3NzLWNuLWhvbmdrb25nLmFsaXl1bmNzLmNvbS91cmlzLnR4dA==",
    "aHR0cHM6Ly9wdWItMjBlY2NkNzhhZjlmNGUwNGJlZWFlMjZmNjVjZjc0NmMucjIuZGV2L3VyaXMudHh0",
  ];
  talker.info('开始请求域名列表...');
  final dio = Dio(BaseOptions(receiveTimeout: const Duration(seconds: 3)));
  while (urls.isNotEmpty) {
    try {
      talker.info('请求域名列表: ${urls.first}');
      final u = VicCryptoHelper.base64.decode(urls.removeAt(0));
      final r = await dio.getUri(Uri.parse(u));
      if (r.data is String) {
        final urls = _parse(r.data as String);
        while (urls.isNotEmpty) {
          final url = urls.removeAt(0);
          try {
            await dio.getUri(Uri.parse('$url/md-app-version1?t=${DateTime.now().millisecondsSinceEpoch}'));
            return url;
          } catch (e) {
            continue;
          }
        }
      }
    } catch (e) {
      continue;
    }
  }
  return null;
}

abstract class ApiBaseUrl {
  static String? apiUrl;
  static Future<void> ensureInitialized({required void Function(String msg) onError}) async {
    final baseUrl = await _query();
    // 域名轮询失败
    if (baseUrl == null) {
      final s = 'Disconnected from server.\n Please contact us.';
      onError(s);
      throw Exception(s);
    } else {
      talker.info('当前API调用地址: $baseUrl');
      apis.setBaseUrl(baseUrl);
    }
  }
}
