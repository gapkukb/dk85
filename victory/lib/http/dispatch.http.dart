part of 'http.dart';

typedef HttpDispatch<T> =
    Future<T> Function({
      Object? payload,
      Object? data,
      Map<String, dynamic>? queryParameters,
      CancelToken? cancelToken,
      Options? options,
      void Function(int, int)? onSendProgress,
      void Function(int, int)? onReceiveProgress,
    });

typedef HttpMethod =
    HttpDispatch<R> Function<R, T>(
      String path, {
      bool? loading,
      bool? silent,
      bool? throwable,
      bool? normalize,
      int? retry,
      T Function(Map<String, dynamic> json)? decoder,
    });

class Http {
  late final Dio dio;
  late final HttpMethod get;
  late final HttpMethod post;

  Http(BaseOptions options) {
    dio = Dio(options);
    get = _factory(dio, 'get');
    post = _factory(dio, 'post');
  }
}

HttpMethod _factory(Dio dio, String method) {
  return <R, T>(path, {loading, silent, throwable, normalize, retry, decoder}) {
    final o = HttpOptions(
      showLoading: loading ?? false,
      silent: silent ?? false,
      throwable: throwable ?? true,
      normalizable: normalize ?? true,
      retry: retry ?? 0,
    );
    return ({payload, data, queryParameters, cancelToken, options, onSendProgress, onReceiveProgress}) {
      options ??= Options();
      options.method ??= method;
      options.httpOptions = o;
      return dio
          .request(
            path,
            options: options,
            data: data,
            queryParameters: queryParameters,
            onSendProgress: onSendProgress,
            onReceiveProgress: onReceiveProgress,
          )
          .then<R>((
            response,
          ) {
            final data = response.data['data'];
            if (decoder == null) return data;
            if (data is Map<String, dynamic>) return decoder(data) as R;
            if (data is List) return List<T>.from(data.map((x) => decoder(x))) as R;
            return data;
          });
    };
  };
}
