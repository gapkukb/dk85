part of 'http.dart';

class HttpLoadingPlugin extends Interceptor {
  int count = 0;
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (options.loading == true && count++ == 0) {
      print('显示加载中...');
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _close(response.requestOptions.loading);
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    _close(err.requestOptions.loading);
    super.onError(err, handler);
  }

  _close(bool? loading) {
    if (loading == true && --count <= 0) {
      print('隐藏加载中...');
    }
  }
}
