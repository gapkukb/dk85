part of 'http.dart';

class ShowErrorsHttpInterceptor extends Interceptor {
  final void Function(String msg) showError;

  ShowErrorsHttpInterceptor({required this.showError});

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.requestOptions.custom.showError) {
      if (err.type == DioExceptionType.connectionTimeout) {
        showError("connectionTimeout".tr);
      } else if (err.type == DioExceptionType.sendTimeout) {
        showError("sendTimeout".tr);
      } else if (err.type == DioExceptionType.receiveTimeout) {
        showError("receiveTimeout".tr);
      } else {
        final msg = err.message ?? err.response?.statusMessage;
        if (msg != null) {
          showError(msg);
        }
      }
    }
    super.onError(err, handler);
  }
}
