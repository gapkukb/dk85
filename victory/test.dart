import 'dart:io';

import 'package:uuid/v1.dart';
import 'package:uuid/v4.dart';

void main(List<String> args) async {
  final request = HttpClient()..connectionTimeout = const Duration(seconds: 1);
  try {
    await request
        .head('192.168.254.112', 8888, '')
        .then((e) {
          print(1323);
          return e;
        })
        .whenComplete(() => request.close(force: true));
  } catch (e) {
    print(e);
  }
}
