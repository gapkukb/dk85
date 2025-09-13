part of 'http.dart';

/// 添加请求头等前置处理
class HttpPreprocessInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll({
      HttpHeaders.acceptLanguageHeader: storage.locale.value,
      'X-qid': Random.secure().nextInt(99999999).toRadixString(36),
      'X-site-id': 'abc',
      'X-client': '1',
    });
    super.onRequest(options, handler);
  }
}
