part of 'index.dart';

/// 错误处理，抛出消息等
class ErrorsHttpInterceptor extends Interceptor {
  final bool defaultValue;
  final String keyName;
  final String? Function(String message, int? code, int httpCode) handler;

  ErrorsHttpInterceptor({required this.handler, this.keyName = 'message', this.defaultValue = true});

  @override
  void onError(DioException err, ErrorInterceptorHandler next) {
    // 手动取消的的不处理
    if (err.type == DioExceptionType.cancel) return next.reject(err);

    final msg = err.response?.data[keyName] as String? ?? err.message;

    // 没有错误消息不处理
    if (msg == null) return next.reject(err);

    // 配置不显示的不处理
    final options = HttpOptions.get(err.requestOptions);
    final showable = options.error ?? options.silent == null ? defaultValue : !options.silent!;

    if (!showable) return next.reject(err);

    // 得到错误信息并提示
    final text = handler(msg, err.response?.data['code'], err.response?.statusCode ?? 0);

    if (text == null) return next.reject(err);

    BotToast.showText(text: text);

    super.onError(err, next);
  }
}
