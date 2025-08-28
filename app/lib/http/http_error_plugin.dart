part of 'http.dart';

/// 错误处理拦截器，主要用于自动抛出错误
class HttpErrorPlugin extends Interceptor {
  static const _message = 'message';

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print('response');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException error, ErrorInterceptorHandler handler) {
    final message = _findErrorMessage(error);

    if (message != null) {
      // 处理错误信息
      print(message.toString());
    }
    handler.next(error);
  }

  String? _findErrorMessage(DioException err) {
    if (err.response == null) return err.message;
    final dynamic data = err.response!.data;

    if (data is Map && data[_message]) {
      return data[_message];
    }

    if (data is String && data.isNotEmpty) {
      return data;
    }

    // 兜底
    return "${err.response!.statusMessage ?? 'Unknown Exception'} - ${err.response!.statusCode}";
  }
}
