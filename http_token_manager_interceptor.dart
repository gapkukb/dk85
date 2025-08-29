import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';

/// typedef
/// 处理令牌刷新逻辑。
typedef OnRefreshCallback =
    Future<void> Function(Dio dio, TokenManager manager);

/// 确定是否需要刷新令牌。
typedef ShouldRefreshCallback = bool Function(Response?);

/// 为请求生成授权标头。
typedef AuthHeaderCallback =
    Map<String, dynamic>? Function(TokenManager manager);

/// 验证令牌是否仍然有效。
typedef IsTokenValidCallback = bool Function(String);

/// 直接放行的请求。
typedef ShouldPassable =
    bool Function(RequestOptions options, TokenManager manager);

/// typedef end

abstract class TokenManager {
  String? accessToken;
  String? refreshToken;

  clear() {
    accessToken = null;
    refreshToken = null;
  }

  set({String? accessToken, String? refreshToken}) {
    this.accessToken = accessToken;
    this.refreshToken = refreshToken;
  }
}

class _TokenManager extends TokenManager {}

// 全局单例
final tokenManager = _TokenManager();

/// token管理插件
class HttpTokenManagerInterceptor extends Interceptor {
  late final Dio replayer;
  late final TokenManager manager;
  final OnRefreshCallback onRefresh;
  final ShouldRefreshCallback shouldRefresh;
  final AuthHeaderCallback setAuthHeader;
  final IsTokenValidCallback isTokenValid;
  final ShouldPassable shouldPassable;

  Completer? completer;

  HttpTokenManagerInterceptor({
    TokenManager? manager,
    required Dio dio,
    required this.onRefresh,
    required this.shouldRefresh,
    required this.setAuthHeader,
    this.shouldPassable = _shouldPassable,
    this.isTokenValid = _isAccessTokenValid,
  }) {
    this.manager = manager ?? tokenManager;
    Future.microtask(() => {replayer = dio.clone()});
  }

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // 直接放行
    if (shouldPassable(options, manager)) {
      return handler.next(options);
    }
    // 等待刷新完成
    if (completer != null) {
      await completer!.future;
    }

    // 添加请求头
    options.headers.addAll(setAuthHeader(manager) ?? {});

    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final request = err.requestOptions;
    final response = err.response;

    // 直接放行
    if (shouldPassable(request, manager)) {
      return super.onError(err, handler);
    }

    // 不需要刷新token的错误，直接放行
    if (!shouldRefresh(response)) {
      return super.onError(err, handler);
    }
    if (completer != null) {
      await completer!.future;
    }

    final a = _createDio(request);
    completer = Completer();

    final b = await a.get('/refresh').catchError((e) {
      super.onError(err, handler);
    });
    completer!.complete();
    manager.set(
      accessToken: b.data['data']['token'],
      refreshToken: b.data['data']['token'],
    );

    if (request.extra['_replay'] == true) {
      return super.onError(err, handler);
    }

    final res = await replayer.fetch(
      request.copyWith(
        headers: request.headers..addAll(setAuthHeader(manager) ?? {}),
        extra: request.extra..addAll({'_replay': true}),
        data: request.data is FormData
            ? (request.data as FormData).clone()
            : request.data,
      ),
    );
  }
}

bool _isAccessTokenValid(String accessToken) {
  return true;
}

bool _shouldPassable(RequestOptions options, TokenManager manager) {
  return false;
}

Dio _createDio(RequestOptions request) {
  final headers = {...request.headers};
  headers.remove(HttpHeaders.contentLengthHeader);
  return Dio(
    BaseOptions(
      baseUrl: request.baseUrl,
      sendTimeout: request.sendTimeout,
      receiveTimeout: request.receiveTimeout,
      extra: request.extra,
      headers: headers,
      responseType: request.responseType,
      contentType: request.contentType,
      validateStatus: request.validateStatus,
      receiveDataWhenStatusError: request.receiveDataWhenStatusError,
      followRedirects: request.followRedirects,
      maxRedirects: request.maxRedirects,
      requestEncoder: request.requestEncoder,
      responseDecoder: request.responseDecoder,
      listFormat: request.listFormat,
    ),
  );
}
