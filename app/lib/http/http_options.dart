part of 'http.dart';

const _httpOptionsKey = '_options';

class HttpOptions extends Options {
  late final bool loading;
  late final bool error;
  late final bool silent;
  late final bool normalizable;
  late final bool decompressable;

  HttpOptions({
    final bool? loading,
    final bool? error,
    final bool? silent,
    final bool? normalizable,
    final bool? decompressable,
  }) {
    this.loading = loading ?? false;
    this.error = error ?? true;
    this.silent = silent ?? false;
    this.normalizable = normalizable ?? true;
    this.decompressable = decompressable ?? false;
  }
}

extension OptionsGetter on RequestOptions {
  HttpOptions get httpOptions => extra[_httpOptionsKey];

  bool get loading => httpOptions.loading;
  bool get error => httpOptions.error;
  bool get silent => httpOptions.silent;
  bool get normalizable => httpOptions.normalizable;
  bool get decompressable => httpOptions.decompressable;
}
