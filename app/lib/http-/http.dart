import 'dart:io';

import 'package:dio/dio.dart';
import '/http-/http_error_plugin.dart';
import '/http-/http_loading_plugin.dart';
import '/http-/http_transformer.dart';

const duration = Duration(seconds: 30);

final http = Dio(
  BaseOptions(
    baseUrl: 'https://jjj2.com/app',
    connectTimeout: duration,
    receiveTimeout: duration,
    sendTimeout: duration,
    responseType: ResponseType.json,
    contentType: ContentType.json.mimeType,
  ),
)..transformer = MyTransformer();

class Test extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print('test');
    super.onResponse(response, handler);
  }
}

void main(List<String> args) async {
  http.interceptors.add(HttpLoadingPlugin());
  http.interceptors.add(HttpErrorPlugin());

  await Future.wait([
    http.post(
      '/quickRegister1',
      data: {'': '13800138000', 'password': '123456'},
    ),
    http.post(
      '/quickRegister2',
      data: {'': '13800138000', 'password': '123456'},
    ),
    http.post(
      '/quickRegister3',
      data: {'': '13800138000', 'password': '123456'},
    ),
    http.post(
      '/quickRegister4',
      data: {'': '13800138000', 'password': '123456'},
    ),
  ]);
}
