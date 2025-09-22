import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:encrypt/encrypt.dart';

import '../apis/apis.dart';
import '../env.dart';

List<String> _parse(String source) {
  final key = Key.fromUtf8(utf8.decode(base64Decode("YXNkZmxAc2ZnYUhzOCNhYQ==")));
  final iv = IV.fromUtf8(utf8.decode(base64Decode('amFzbGtmeGpAYWYjM0hzOA==')));
  final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
  Encrypted encryptedFromBase64 = Encrypted.fromBase64(source);
  String decryptedText = encrypter.decrypt(encryptedFromBase64, iv: iv);
  return decryptedText.split("\n");
}

Future<String?> _query() async {
  if (Environment.isNotProd) {
    return "https://mdgametest.xyz";
  }
  final urls = ["https://md-business-prd.oss-cn-hongkong.aliyuncs.com/uris.txt", "https://pub-20eccd78af9f4e04beeae26f65cf746c.r2.dev/uris.txt"];

  final dio = Dio(BaseOptions(receiveTimeout: const Duration(seconds: 3)));
  while (urls.isNotEmpty) {
    try {
      final r = await dio.getUri(Uri.parse(urls.removeAt(0)));
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
  static Future<void> initialize({required void Function(String msg) onError}) async {
    final baseUrl = await _query();
    // 域名轮询失败
    if (baseUrl == null) {
      final s = 'Disconnected from server.\n Please contact us.';
      onError(s);
      throw Exception(s);
    } else {
      http.dio.options.baseUrl = baseUrl;
      print(http.dio.options.baseUrl);
    }
  }
}
