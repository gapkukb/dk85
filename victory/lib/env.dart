import 'package:flutter/foundation.dart';

abstract class Environment {
  static const env = String.fromEnvironment('ENV');
  static const bool isDev = kDebugMode || env == 'dev';
  static const bool isFat = env == 'fat';
  static const bool isUat = env == 'uat';
  static const bool isProd = env == 'production';
  static const bool isNotProd = env != 'production';
}
