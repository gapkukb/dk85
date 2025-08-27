import 'dart:convert';
import 'package:crypto/crypto.dart' show md5;

String toMd5(String input) {
  final content = utf8.encode(input);
  final digest = md5.convert(content);
  return digest.toString();
}
