part of 'http.dart';

class HttpMethod {
  final Dio dio;
  final String method;
  HttpMethod(this.dio, this.method);

  Dispatcher<R, Q> call<R, Q>(
    final String path, [
    final R Function(Map<String, dynamic>)? decode,
    HttpOptions? httpOptions,
    Options? options,
  ]) {
    return Dispatcher<R, Q>(path, method, dio, decode, httpOptions, options);
  }
}

class Dispatcher<R, Q> {
  final HttpOptions? httpOptions;
  final Options? options;
  final String path;
  final String method;
  final Dio dio;
  final R Function(Map<String, dynamic>)? serializer;
  CancelToken? _cancellation;

  Dispatcher(
    this.path,
    this.method,
    this.dio,
    this.serializer,
    this.httpOptions,
    this.options,
  );

  Future<R> call({
    dynamic payload,
    HttpOptions? httpOptions,
    Options? options,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) {
    final finalOptions = combineOptions(this.options, options);
    finalOptions.method ??= method;
    final finalHttpOptions = combineHttpOptions(this.httpOptions, httpOptions);

    finalOptions.extra = {
      if (this.options?.extra != null) ...this.options!.extra!,
      if (options?.extra != null) ...options!.extra!,
      _httpOptionsKey: finalHttpOptions,
    };

    if (finalHttpOptions.cancelable == true) {
      _cancellation = CancelToken();
    }

    return dio
        .request(
          path,
          data: data,
          queryParameters: queryParameters,
          options: finalOptions,
          onReceiveProgress: onReceiveProgress,
          onSendProgress: onSendProgress,
          cancelToken: _cancellation,
        )
        .then((resp) {
          if (serializer != null) {
            return serializer!(resp.data);
          }
          return resp.data;
        });
  }

  abort([String? reason]) {
    _cancellation?.cancel(reason);
  }
}
