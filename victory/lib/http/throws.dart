part of 'http.dart';

class ThrowsHttpInterceptor extends Interceptor {
  final void Function(String msg) showError;

  ThrowsHttpInterceptor({required this.showError});

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.requestOptions.custom.throwable) {
      final msg = err.message ?? err.response?.statusMessage;
      if (msg != null) {
        showError(msg);
      }
    }
    super.onError(err, handler);
  }
}
