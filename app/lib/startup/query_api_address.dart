import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class _BackendApiManager {
  late final String api;
  final List<String> presets = ['https://www.google.com', 'https://www.github.com'];

  /// 接口防封查询
  Future<String> _query() async {
    return 'https://www.jjj2.com';

    Never reject() {
      debugPrint('未查询到接口地址列表');
      throw 'server error!';
    }

    final dio = Dio();
    final o = Options(responseType: ResponseType.plain);
    final preset = await Future.any<Response<String>>(presets.map((item) => dio.get(item, options: o)));
    if (preset.data == null || preset.data!.isEmpty) {
      reject();
    }
    // 获取接口地址列表
    final resp = await dio.get<String>(preset.data!, options: o);
    if (resp.data == null || resp.data!.isEmpty) {
      reject();
    }

    final List<String> uris = resp.data!.split(";");

    if (uris.isEmpty) {
      reject();
    }

    // 批量查询，只取第一个成功的;

    final querys = uris.map((uri) => dio.head(uri));

    try {
      final uri = await Future.any(querys);
      return uri.requestOptions.path;
    } catch (e) {
      reject();
    }
  }

  Future initialize() async {
    try {
      api = await _query();
    } catch (e) {
      debugPrint('获取接口地址失败');
      rethrow;
    }
  }
}

final backendApiManager = _BackendApiManager();
