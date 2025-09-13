part of 'http.dart';

class HttpErrorsInterceptor extends Interceptor {
  final void Function(String msg) _show;
  static const _message = 'message';

  HttpErrorsInterceptor(this._show);

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final message = _findErrorMessage(err);
    if (message != null) _show(message);
    handler.next(err);
  }

  String? _findErrorMessage(DioException err) {
    if (err.message != null) {
      return err.message;
    }
    final resp = err.response;
    if (resp == null) return err.message;
    final dynamic data = resp.data;

    if (data is Map && data[_message] != null) {
      return data[_message];
    }

    // if (data is String && data.isNotEmpty) {
    //   return data;
    // }

    // 兜底
    return "${err.response!.statusMessage ?? 'Unknown Exception'} - ${err.response!.statusCode}";
  }
}
