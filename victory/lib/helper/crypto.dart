import 'dart:convert'; // for utf8.encode
import 'package:crypto/crypto.dart';

void main() {
  String data = "hello world";

  // 1. 把字符串转成 bytes
  List<int> bytes = utf8.encode(data);

  // 2. 计算 MD5
  Digest md5Result = md5.convert(bytes);

  // 3. 输出结果
  print("MD5: $md5Result");
  print("MD5 (hex): ${md5Result.toString()}");
}

abstract class VicCryptoHelper {
  static String toMd5(String text) {
    return md5.convert(utf8.encode(text)).toString();
  }
}
