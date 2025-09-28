part of 'http.dart';

class VicHttpImpl<R, T> {
  final Dio dio;
  final String path;
  final String method;
  final bool? cancelable;
  final T Function(Map<String, dynamic> json)? decoder;
  late final HttpOptions httpOptions;
  late final bool _isList;
  CancelToken? cancelToken;

  VicHttpImpl(
    this.dio,
    this.method,
    this.path, {
    final bool? loading,
    final bool? silent,
    final bool? debug,
    final bool? showError,
    final bool? raw,
    final int? retry,
    this.cancelable,
    this.decoder,
  }) {
    _isList = R.toString().startsWith('List');
    httpOptions = HttpOptions(
      loading: loading ?? false,
      silent: silent ?? false,
      showError: showError ?? true,
      raw: raw ?? false,
      retry: retry ?? 0,
      debug: debug ?? false,
    );
  }

  Future<R?> call({
    Object? payload,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
  }) {
    if (cancelable == true) {
      cancelToken = CancelToken();
    }
    options ??= Options();
    options.method ??= method;
    options.httpOptions = httpOptions;
    return dio
        .request(
          path,
          data: data ?? payload,
          queryParameters: queryParameters ?? (payload as Map<String, dynamic>?),
          cancelToken: cancelToken,
          options: options,
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceiveProgress,
        )
        .then<R?>((
          response,
        ) {
          if (httpOptions.raw) return response.data;
          final data = response.data['data'];
          if (data == null) return null;
          if (decoder == null) return data;
          if (data is Map<String, dynamic>) return decoder!(data) as R;
          if (data is List) {
            if (_isList) return List<T>.from(data.map((x) => decoder!(x))) as R;
            throw Exception("泛型不匹配返回值 , $R ===> ${data.runtimeType}");
          }
          if (_isList) return [] as R;
          return data;
        })
        .whenComplete(() {
          cancelToken = null;
        });
  }

  abort([String? reason]) {
    cancelToken?.cancel(reason);
  }
}

class VicHttpMethod {
  final String method;
  final Dio dio;

  const VicHttpMethod(this.method, this.dio);

  VicHttpImpl<R, R> call<R>(
    String path, {
    final bool? loading,
    final bool? silent,
    final bool? showError,
    final bool? raw,
    final bool? cancelable,
    final bool? debug,
    int? retry,
    R Function(Map<String, dynamic> json)? decoder,
  }) {
    return VicHttpImpl(
      dio,
      method,
      path,
      decoder: decoder,
      loading: loading,
      raw: raw,
      retry: retry,
      silent: silent,
      showError: showError,
      debug: debug,
    );
  }

  VicHttpImpl<List<R>, R> list<R>(
    String path, {
    final bool? loading,
    final bool? silent,
    final bool? showError,
    final bool? raw,
    final bool? cancelable,
    final bool? debug,
    int? retry,
    R Function(Map<String, dynamic> json)? decoder,
  }) {
    return VicHttpImpl(
      dio,
      method,
      path,
      decoder: decoder,
      loading: loading,
      raw: raw,
      retry: retry,
      silent: silent,
      showError: showError,
      debug: debug,
    );
  }
}

class VicHttp {
  late final Dio dio;
  late final VicHttpMethod get;
  late final VicHttpMethod post;

  VicHttp(BaseOptions baseOptions) {
    dio = Dio(baseOptions);
    get = VicHttpMethod('get', dio);
    post = VicHttpMethod('post', dio);
  }
}
