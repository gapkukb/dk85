part of 'index.dart';

class LoadingHttpInterceptor extends Interceptor {
  final bool defaultValue;
  final Function(bool loading) onLoading;
  var count = 0;

  LoadingHttpInterceptor({required this.defaultValue, required this.onLoading});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (_getValue(options)) {
      if (count++ == 0) {
        onLoading(true);
      }
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (_getValue(response.requestOptions)) {
      if (count-- == 0) {
        onLoading(false);
      }
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (_getValue(err.requestOptions)) {
      if (count-- == 0) {
        onLoading(false);
      }
    }
    super.onError(err, handler);
  }

  bool _getValue(RequestOptions options) {
    final o = HttpOptions.get(options);
    return o.loading ?? o.silent ?? defaultValue;
  }
}
