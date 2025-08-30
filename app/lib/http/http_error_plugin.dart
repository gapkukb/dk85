part of 'http.dart';

/// 错误处理拦截器，主要用于自动抛出错误
class HttpErrorPlugin extends Interceptor {
  static const _message = 'message';

  @override
  void onError(DioException error, ErrorInterceptorHandler handler) {
    final message = _findErrorMessage(error);

    if (message != null) {
      // 处理错误信息
      BotToast.showText(text: message);
    }
    handler.next(error);
  }

  String? _findErrorMessage(DioException err) {
    final resp = err.response;
    if (resp == null) return err.message;
    final dynamic data = resp.data;

    if (data is Map && data[_message] != null) {
      return data[_message];
    }

    if (data is String && data.isNotEmpty) {
      return data;
    }

    // 兜底
    return "${err.response!.statusMessage ?? 'Unknown Exception'} - ${err.response!.statusCode}";
  }
}
