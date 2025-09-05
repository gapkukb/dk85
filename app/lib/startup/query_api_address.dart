import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

/// 接口防封查询
Future<String> queryApiAddress() async {
  return 'https://www.jjj2.com';

  Never reject() {
    throw 'server error!';
  }

  final dio = Dio();
  // 获取接口地址列表
  final resp = await dio.get<String>('https://www.google.com', options: Options(responseType: ResponseType.plain));
  if (resp.data == null || resp.data!.isEmpty) {
    debugPrint('未查询到接口地址列表');
    reject();
  }

  final List<String> uris = resp.data!.split(";");

  if (uris.isEmpty) {
    debugPrint('未查询到接口地址列表');
    reject();
  }

  // 批量查询，只取第一个成功的;

  final querys = uris.map((uri) => dio.head(uri));

  try {
    final uri = await Future.any(querys);
    return uri.requestOptions.path;
  } catch (e) {
    debugPrint('无有效地址');
    reject();
  }
}
