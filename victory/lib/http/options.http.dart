part of 'http.dart';

class HttpOptions {
  final bool loading;
  final bool silent;
  final bool showError;
  final bool raw;
  final bool debug;
  final int retry;

  HttpOptions({required this.loading, required this.silent, required this.showError, required this.raw, required this.retry, required this.debug});
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
