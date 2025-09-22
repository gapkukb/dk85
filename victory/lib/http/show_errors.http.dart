part of 'http.dart';

class showErrorsHttpInterceptor extends Interceptor {
  final void Function(String msg) showError;

  showErrorsHttpInterceptor({required this.showError});

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.requestOptions.custom.showError) {
      final msg = err.message ?? err.response?.statusMessage;
      if (msg != null) {
        showError(msg);
      }
    }
    super.onError(err, handler);
  }
}
