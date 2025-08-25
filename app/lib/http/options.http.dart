part of 'index.dart';

class HttpOptions {
  /// 是否显示加载动画
  final bool? loading;

  /// 请求是否可取消
  final bool? cancellable;

  /// 请求失败时是否提示错误信息
  final bool? error;

  /// 是否沉默请求，不显示loading和error，优先级低于loading ,error 配置
  final bool? silent;

  /// 请求失败的重试次数，"0" 表示不重新请求
  final int? retry;

  /// 是否对响应体拆包,比如{code,data,message}的固定格式会直接返回data
  final bool? normalizable;

  /// 是否对请求参数加密
  final bool? encodable;

  /// 是否对响应体解密
  final bool? decodable;

  /// 是否对请求响应体解压，针对后端的压缩接口
  final bool? decompressable;

  const HttpOptions({this.loading, this.cancellable, this.error, this.silent, this.retry, this.normalizable, this.encodable, this.decodable, this.decompressable});

  copyWith({
    final bool? loading,
    final bool? cancellable,
    final bool? error,
    final bool? silent,
    final int? retry,
    final bool? normalizable,
    final bool? encodable,
    final bool? decodable,
    final bool? decompressable,
  }) {
    return HttpOptions(
      loading: loading ?? this.loading,
      cancellable: cancellable ?? this.cancellable,
      error: error ?? this.error,
      silent: silent ?? this.silent,
      retry: retry ?? this.retry,
      normalizable: normalizable ?? this.normalizable,
      encodable: encodable ?? this.encodable,
      decodable: decodable ?? this.decodable,
      decompressable: decompressable ?? this.decompressable,
    );
  }

  HttpOptions merge(HttpOptions? options) {
    if (options == null) return this;
    return copyWith(
      loading: options.loading,
      cancellable: options.cancellable,
      error: options.error,
      silent: options.silent,
      retry: options.retry,
      normalizable: options.normalizable,
      encodable: options.encodable,
      decodable: options.decodable,
      decompressable: options.decompressable,
    );
  }

  static const extraKey = '__httpOptions';

  static HttpOptions get(RequestOptions options) {
    return options.extra[extraKey];
  }

  static void set(RequestOptions options, HttpOptions httpOptions) {
    options.extra[extraKey] = httpOptions;
  }
}
