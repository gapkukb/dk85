import 'package:flutter/foundation.dart';

abstract class Environment {
  static const env = String.fromEnvironment('ENV');
  static const bool isDev = kDebugMode || env == 'DEV';
  static const bool isFat = env == 'FAT';
  static const bool isUat = env == 'UAT';
  static const bool isProd = env == 'PROD';
  static const bool isNotProd = env != 'PROD';
}

void main(List<String> args) {
  print(DateTime.tryParse(""));
}
