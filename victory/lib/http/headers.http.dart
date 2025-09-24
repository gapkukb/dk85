part of 'http.dart';

class HeadersHttpInterceptor extends Interceptor {
  final _uuid = const UuidV4();
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll({
      'X-App-Package': VicAppInfo.shared.packageName,
      'X-Qid': _uuid.generate(),
      'X-Version': VicAppInfo.shared.buildNumber,
      HttpHeaders.acceptLanguageHeader: stores.app.locale.value,
    });
    super.onRequest(options, handler);
  }
}
