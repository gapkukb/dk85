part of 'apis.dart';

const duration = const Duration(seconds: 10);
final http = Http(BaseOptions(connectTimeout: duration, sendTimeout: duration, receiveTimeout: duration));
