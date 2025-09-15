part of 'http.dart';

typedef HttpDispatcher<T> =
    Future<T> Function({
      Map<String, dynamic>? payload,
      Object? data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onReceiveProgress,
      ProgressCallback? onSendProgress,
    });

typedef HttpMethod =
    HttpDispatcher<T> Function<T>(
      String path, {
      T Function(Map<String, dynamic> json)? decoder,
      bool? loading,
      bool? error,
      bool? silent,
      bool? decompressable,
      bool? normalizable,
    });

HttpMethod _http(Dio dio, String method) {
  final withBody = method == 'post' || method == 'put' || method == 'patch';
  return <T>(path, {decoder, loading, error, silent, decompressable, normalizable}) {
    return ({payload, data, queryParameters, options, cancelToken, onReceiveProgress, onSendProgress}) {
      final o = options?.copyWith(method: method) ?? Options(method: method);
      o.extra ??= {};
      o.extra![_httpOptionsKey] = HttpOptions(loading: loading, error: error, silent: silent, decompressable: decompressable, normalizable: normalizable);

      return dio
          .request(
            path,
            data: data ?? (withBody ? payload : null),
            queryParameters: queryParameters ?? (withBody ? null : payload),
            options: o,
            cancelToken: cancelToken,
            onReceiveProgress: onReceiveProgress,
            onSendProgress: onSendProgress,
          )
          .then((resp) {
            if (decoder == null) return resp.data;
            return decoder(resp.data);
            // final r = v.data;
            // if (decoder == null) return r as T;
            // // ignore: dead_code
            // if (r is Map<String, dynamic>) return decoder(r ?? {}) as T;
            // if (T.toString().startsWith('List<')) {
            //   if (r == null) return [] as T;
            //   if (r is List) {
            //     return List<R>.from(r.map((x) => decoder(x))) as T;
            //   }
            //   print('00.0000');
            //   return r as T;
            // }

            // return r as T;
          });
    };
  };
}

class Http {
  late final HttpMethod get;
  late final HttpMethod post;
  late final HttpMethod put;
  late final HttpMethod delete;
  Http(Dio dio) {
    get = _http(dio, 'get');
    post = _http(dio, 'post');
    put = _http(dio, 'put');
    delete = _http(dio, 'delete');
  }
}
