import 'package:dio/dio.dart';

/// 错误处理拦截器，主要用于自动抛出错误
class HttpErrorPlugin extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print('response');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print(err.response?.data);
    final message =
        err.response?.data?['message'] ??
        err.message ??
        err.response?.statusMessage;

    if (message != null) {
      // 处理错误信息
      print(message.toString());
    }
    handler.next(err);
  }
}
