part of 'http.dart';

class TokenManager {
  // String? _lastToken;
  String? accessToken;
  String? refreshToken;
  Map<String, String> _header = {};

  void update(String accessToken, String refreshToken) {
    // _lastToken = this.accessToken;
    this.accessToken = 'Bearer $accessToken';
    this.refreshToken = refreshToken;
    _header = {HttpHeaders.authorizationHeader: this.accessToken!};

    // 1分钟后同步新旧token
    // Timer(Duration(minutes: 1), () {
    //   _lastToken = this.accessToken;
    // });
  }

  void clear() {
    accessToken = refreshToken = null;
    _header = {};
  }

  Map<String, String>? getAuthHeader() {
    return _header;
  }

  Map<String, dynamic> toJson() {
    return {'accessToken': accessToken, 'refreshToken': refreshToken};
  }
}

class HttpAuthInterceptor extends Interceptor {
  final TokenManager tokenManager;
  // final bool Function(Response response) shouldRefresh;
  // final Future<void> Function(Dio refreshDio, TokenManager tokenManager) onRefresh;
  final void Function() onLogin;
  late final Dio _refetcher;
  var _completer = Completer<void>()..complete();

  HttpAuthInterceptor({required Dio dio, required this.tokenManager, required this.onLogin}) {
    _refetcher = dio.clone();
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    if (!_completer.isCompleted) {
      await _completer.future;
    }

    final authHeader = tokenManager.getAuthHeader();

    if (authHeader != null) {
      options.headers.addAll(authHeader);
    }

    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final response = err.response, options = err.requestOptions;

    /// 检测是否token过期
    if (!_isTokenExpired(response)) return handler.next(err);
    final headerToken = options.headers[HttpHeaders.authorizationHeader];

    /// 如果是越权调用，直接提示登录
    if (headerToken == null) {
      handler.reject(err);
      onLogin();
      return;
    }

    /// 如果token正在刷新，等待token刷新完成
    if (!_completer.isCompleted) {
      await _completer.future;
    }

    /// 只有第一次过期的接口进行token刷新
    if (headerToken == tokenManager.accessToken) {
      final token = await _refresh(options, handler);
      tokenManager.update(token, token);
    }

    /// 重放已过期的请求
    try {
      final resp = await _refetcher.fetch(err.requestOptions..headers.addAll(tokenManager._header));
      handler.resolve(resp);
      ResponseInterceptorHandler();
    } catch (e) {
      handler.next(err);
    }
  }

  bool _isTokenExpired(Response? resp) {
    if (resp == null) return false;
    if (resp.statusCode == 401) return true;
    if (resp.data is! Map) return false;
    if (resp.data['data'] is! Map) return false;
    return resp.data['data']['code'] == 666;
  }

  Future<String> _refresh(RequestOptions options, ErrorInterceptorHandler handler) async {
    _completer = Completer();
    return Dio()
        .fetch(options.copyWith(path: '/refresh')..headers.remove(HttpHeaders.contentLengthHeader))
        .then<String>((resp) {
          final d = resp.data;
          if (d is Map && d['data'] is Map && d['data']['token'] is String) {
            _completer.complete();
            return d['data']['token'] as String;
          }
          throw resp;
        })
        .catchError((e) {
          _completer.completeError(e);
          handler.reject(e);
          throw e;
        });
  }
}
