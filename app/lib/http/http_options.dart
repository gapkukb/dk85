part of 'http.dart';

const _httpOptionsKey = "_http_options";

extension OptionsExtension on Options {
  Options merge(Options? options) {
    if (options == null) return this;
    return copyWith(
      contentType: options.contentType,
      extra: options.extra,
      followRedirects: options.followRedirects,
      headers: options.headers,
      listFormat: options.listFormat,
      maxRedirects: options.maxRedirects,
      method: options.method,
      persistentConnection: options.persistentConnection,
      preserveHeaderCase: options.preserveHeaderCase,
      receiveDataWhenStatusError: options.receiveDataWhenStatusError,
      receiveTimeout: options.receiveTimeout,
      requestEncoder: options.requestEncoder,
      responseDecoder: options.responseDecoder,
      responseType: options.responseType,
      sendTimeout: options.sendTimeout,
      validateStatus: options.validateStatus,
    );
  }
}

extension OptionsExtension2 on RequestOptions {
  bool? get loading => _http.loading;
  bool? get normalizable => _http.normalizable;
  bool? get error => _http.error;
  bool? get silent => _http.silent;

  HttpOptions get _http {
    return extra[_httpOptionsKey];
  }
}

class HttpOptions {
  final bool? loading;
  final bool? normalizable;
  final bool? error;
  final bool? silent;
  final bool? cancelable;
  final bool? decompressable;
  final int? retry;
  final double Function(RequestOptions options)? retryDelay;

  HttpOptions({
    this.loading,
    this.normalizable,
    this.error,
    this.silent,
    this.cancelable,
    this.decompressable,
    this.retry,
    this.retryDelay,
  });

  HttpOptions copyWith({
    final bool? loading,
    final bool? normalizable,
    final bool? error,
    final bool? silent,
    final bool? cancelable,
    final bool? decompressable,
    final int? retry,
    final double Function(RequestOptions options)? retryDelay,
  }) {
    return HttpOptions(
      loading: loading ?? this.loading,
      normalizable: error ?? this.normalizable,
      error: error ?? this.error,
      silent: error ?? this.silent,
      cancelable: cancelable ?? this.cancelable,
      decompressable: decompressable ?? this.decompressable,
      retry: retry ?? this.retry,
      retryDelay: retryDelay ?? this.retryDelay,
    );
  }

  HttpOptions merge(HttpOptions? options) {
    if (options == null) return this;
    return copyWith(
      error: options.error,
      loading: options.loading,
      normalizable: options.normalizable,
      silent: options.silent,
    );
  }
}

Options combineOptions(Options? options1, Options? options2) {
  if (options1 != null) return options1.merge(options2);
  if (options2 != null) return options2.copyWith();
  return Options();
}

HttpOptions combineHttpOptions(HttpOptions? options1, HttpOptions? options2) {
  if (options1 != null) return options1.merge(options2);
  if (options2 != null) return options2;
  return HttpOptions();
}
