import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:encrypt/encrypt.dart';

List<String> _parse(String source) {
  final key = Key.fromUtf8(utf8.decode(base64Decode("YXNkZmxAc2ZnYUhzOCNhYQ==")));
  final iv = IV.fromUtf8(utf8.decode(base64Decode('amFzbGtmeGpAYWYjM0hzOA==')));
  final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
  Encrypted encryptedFromBase64 = Encrypted.fromBase64(source);
  String decryptedText = encrypter.decrypt(encryptedFromBase64, iv: iv);
  return decryptedText.split("\n");
}

Future<String?> _query() async {
  final urls = ["https://md-business-prd.oss-cn-hongkong.aliyuncs.com/uris.txt", "https://pub-20eccd78af9f4e04beeae26f65cf746c.r2.dev/uris.txt"];

  final dio = Dio(BaseOptions(receiveTimeout: Duration(seconds: 5)));
  while (urls.isNotEmpty) {
    final r = await dio.getUri(Uri.parse(urls.removeAt(0)));
    if (r.data is String) {
      final urls = _parse(r.data as String);
      while (urls.isNotEmpty) {
        final url = urls.removeAt(0);
        try {
          await dio.getUri(Uri.parse('$url/md-app-version?t=${DateTime.now().millisecondsSinceEpoch}'));
        } on DioException catch (_) {
          continue;
        }
        return url;
      }
    }
  }

  return null;
}

abstract class BackendApi {
  static String? apiUrl;
  static Future<void> initialize() async {
    apiUrl = await _query();
  }
}
