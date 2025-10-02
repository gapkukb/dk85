import 'dart:convert'; // for utf8.encode
import 'package:crypto/crypto.dart';
import 'package:string_validator/string_validator.dart';

class _Base64 {
  String decode(String source) {
    if (!source.isBase64) return source;
    return utf8.decode(base64Decode(source));
  }

  String encode(String source) {
    if (source.isBase64) return source;
    return base64Encode(utf8.encode(source));
  }
}

abstract class VicCryptoHelper {
  static String toMd5(String text) {
    return md5.convert(utf8.encode(text)).toString();
  }

  static _Base64 base64 = _Base64();
}
