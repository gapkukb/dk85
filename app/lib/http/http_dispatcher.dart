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
    return Dispatcher<R, Q>(path, dio, decode, null, httpOptions, options);
  }

  Dispatcher<List<R>, Q> list<R, Q>(
    final String path, [
    final R Function(Map<String, dynamic>)? decode,
    HttpOptions? httpOptions,
    Options? options,
  ]) {
    return Dispatcher<List<R>, Q>(
      path,
      dio,
      null,
      decode == null
          ? null
          : (List<Map<String, dynamic>> json) => json.map(decode).toList(),
      httpOptions,
      options,
    );
  }
}

class Dispatcher<R, Q> {
  final HttpOptions? httpOptions;
  final Options? options;
  final String path;
  final Dio dio;
  final R Function(Map<String, dynamic>)? decodeMap;
  final R Function(List<Map<String, dynamic>>)? decodeList;
  CancelToken? _cancellation;

  Dispatcher(
    this.path,
    this.dio,
    this.decodeMap,
    this.decodeList,
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
          data: data ?? payload,
          queryParameters: queryParameters ?? payload,
          options: finalOptions,
          onReceiveProgress: onReceiveProgress,
          onSendProgress: onSendProgress,
          cancelToken: _cancellation,
        )
        .then((resp) {
          final data = resp.data;

          if (data is List && decodeList != null) {
            return decodeList!(data.cast<Map<String, dynamic>>());
          }

          if (data is Map && decodeMap != null) {
            return decodeMap!(resp.data);
          }

          return resp.data;
        });
  }

  abort([String? reason]) {
    _cancellation?.cancel(reason);
  }
}
