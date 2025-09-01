import 'package:dio/dio.dart';

class HttpOptions {
  late final bool loading;
  late final bool showError;
  late final bool silent;
  late final bool decompressable;
  late final bool normalizeable;

  HttpOptions({
    bool? loading,
    bool? showError,
    bool? silent,
    bool? decompressable,
    bool? normalizeable,
  }) {
    this.loading = loading ?? false;
    this.showError = showError ?? true;
    this.silent = silent ?? false;
    this.decompressable = decompressable ?? false;
    this.normalizeable = normalizeable ?? true;
  }
}

const httpKey = '_httpOptions';

extension RequestOptionsOptionsExtension on RequestOptions {
  HttpOptions get httpOptions => extra[httpKey] as HttpOptions;
  set httpOptions(HttpOptions value) {
    extra[httpKey] = value;
  }
}

extension OptionsExtension on Options {
  set httpOptions(HttpOptions value) {
    extra?.putIfAbsent(httpKey, () => value);
  }
}
