import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http_demo/http/http_error_plugin.dart';
import 'package:http_demo/http/http_loading_plugin.dart';
import 'package:http_demo/http/http_options_plugin.dart';
import 'package:http_demo/http/http_transformer.dart';
import 'package:http_demo/http/http_dispatcher.dart';
import 'package:http_demo/http/test.model.dart';

const duration = Duration(seconds: 30);

final _dio =
    Dio(
        BaseOptions(
          baseUrl: 'http://localhost:10010',
          connectTimeout: duration,
          receiveTimeout: duration,
          sendTimeout: duration,
          responseType: ResponseType.json,
          contentType: ContentType.json.mimeType,
        ),
      )
      ..transformer = HttpBackgroundTransformer()
      ..interceptors.add(HttpLoadingPlugin())
      ..interceptors.add(HttpErrorPlugin());

class _HttpDispatcher {
  Future<T> Function({
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  })
  get<T>(
    String path, {
    T Function(Map<String, dynamic> json)? serialize,
    bool? loading,
    bool? showError,
    bool? silent,
    bool? decompressable,
    bool? normalizeable,
  }) {
    return ({
      data,
      queryParameters,
      options,
      cancelToken,
      onReceiveProgress,
    }) async {
      final o = HttpOptions(
        loading: loading,
        showError: showError,
        silent: silent,
        decompressable: decompressable,
        normalizeable: normalizeable,
      );

      options ??= Options(extra: {});
      options.extra ??= {};
      options.httpOptions = o;

      final r = await _dio.get(
        path,
        data: data,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        queryParameters: queryParameters,
        options: options,
      );

      if (serialize != null) {
        if (T is List && r.data is List) {}
        return serialize(r.data);
      }
      ;
      return r.data;
    };
  }
}

final http = _HttpDispatcher();
