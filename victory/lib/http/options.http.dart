part of 'http.dart';

class HttpOptions {
  final bool showLoading;
  final bool silent;
  final bool throwable;
  final bool normalizable;
  final int retry;

  HttpOptions({required this.showLoading, required this.silent, required this.throwable, required this.normalizable, required this.retry});
}

const _key = '__http_options';

extension DioOptionsExt on Options {
  set httpOptions(HttpOptions httpOptions) {
    extra ??= {};
    extra![_key] ??= httpOptions;
  }
}

extension DioRequestOptionsExt on RequestOptions {
  HttpOptions get custom {
    return extra[_key] as HttpOptions;
  }
}
