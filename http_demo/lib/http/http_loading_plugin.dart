import 'package:dio/dio.dart';

class HttpLoadingPlugin extends Interceptor {
  int count = 0;
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (count++ == 0) {
      print('显示加载中...');
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _close();
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    _close();
    super.onError(err, handler);
  }

  _close() {
    if (--count <= 0) {
      print('隐藏加载中...');
    }
  }
}
