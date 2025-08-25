part of 'index.dart';

const K = HttpOptions.extraKey;

class _HttpExcutor<R, Q extends Map<String, dynamic>> {
  CancelToken? cancelToken;
  final Dio dio;
  final String path;
  final Options methodOptions;
  final R Function(Map<String, dynamic> json)? decoder;
  _HttpExcutor(this.path, this.dio, this.decoder, this.methodOptions);

  Future<R> call([Q? payload, HttpOptions? httpOptions, Options? options, final void Function(int, int)? onSendProgress, final void Function(int, int)? onReceiveProgress]) {
    options = methodOptions.copyWith(
      method: options?.method,
      sendTimeout: options?.sendTimeout,
      receiveTimeout: options?.receiveTimeout,
      headers: options?.headers,
      preserveHeaderCase: options?.preserveHeaderCase,
      responseType: options?.responseType,
      contentType: options?.contentType,
      validateStatus: options?.validateStatus,
      receiveDataWhenStatusError: options?.receiveDataWhenStatusError,
      followRedirects: options?.followRedirects,
      maxRedirects: options?.maxRedirects,
      persistentConnection: options?.persistentConnection,
      requestEncoder: options?.requestEncoder,
      responseDecoder: options?.responseDecoder,
      listFormat: options?.listFormat,
    );

    options.extra![K] = (methodOptions.extra![K] as HttpOptions).merge(httpOptions);

    if ((options.extra![K] as HttpOptions).cancellable ?? true) {
      abort();
      cancelToken = CancelToken();
    } else {
      cancelToken = null;
    }

    return dio
        .request<dynamic>(
          path,
          cancelToken: cancelToken,
          options: options,
          data: options.method == 'get' ? null : payload,
          onReceiveProgress: onReceiveProgress,
          onSendProgress: onSendProgress,
          queryParameters: options.method == 'get' ? payload : null,
        )
        .then((x) {
          if (x.data is Map<String, dynamic>) return decoder?.call(x.data) ?? x as R;
          return x.data;
        });
  }

  abort() {
    cancelToken?.cancel('cancelled');
  }
}

class _HttpMethod {
  final String method;
  final Dio dio;

  const _HttpMethod(this.method, this.dio);

  _HttpExcutor<R, Q> call<R, Q extends Map<String, dynamic>>(String path, [R Function(Map<String, dynamic> json)? decoder, HttpOptions? httpOptions, Options? options]) {
    options ??= Options();
    options.extra ??= <String, dynamic>{};
    options.extra![K] = httpOptions ?? const HttpOptions();
    return _HttpExcutor<R, Q>(path, dio, decoder, options);
  }
}

class Http {
  late final Dio _dio;
  late final _HttpMethod get;
  late final _HttpMethod post;
  late final _HttpMethod put;
  late final _HttpMethod delete;

  Http([BaseOptions? options, Dio? dio]) {
    _dio = Dio(options);
    get = _HttpMethod('get', _dio);
    post = _HttpMethod('post', _dio);
    put = _HttpMethod('put', _dio);
    delete = _HttpMethod('delete', _dio);
  }

  bool use(Interceptor interceptor) {
    final before = _length;
    _dio.interceptors.add(interceptor);
    return before != _length;
  }

  bool eject(Type type) {
    final before = _length;
    _dio.interceptors.removeWhere((x) => x.runtimeType == type);
    return before != _length;
  }

  Http clone({BaseOptions? options, Interceptors? interceptors, HttpClientAdapter? httpClientAdapter, Transformer? transformer}) {
    final cloned = _dio.clone(options: options, interceptors: interceptors, httpClientAdapter: httpClientAdapter, transformer: transformer);

    return Http(null, cloned);
  }

  int get _length => _dio.interceptors.length;
}
