part of 'http.dart';

class HttpAuthManager {
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

class HttpAuthInterceptor extends QueuedInterceptor {
  final Dio replayer;
  final HttpAuthManager manager;

  HttpAuthInterceptor(this.replayer, this.manager);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (manager.accessToken != null) {
      options.headers[HttpHeaders.authorizationHeader] = _getAuth(
        manager.accessToken!,
      );
    }
    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final code = err.response?.statusCode;
    if (code != 401 || code != 403 || err.response == null) {
      return handler.next(err);
    }

    final r = err.response!.data;

    // 业务自定义过期码
    if (r is Map && r['code'] != 666) {
      return handler.next(err);
    }

    final t = err.requestOptions.headers[HttpHeaders.authorizationHeader];

    if (t == manager.accessToken) {
      final refresher = _refresher(err.requestOptions);
      final response = await refresher.post('/refresh-token');
      final d = response.data;
      refresher.close();
      if (isFailed(response) || d['data']['token'] == null) {
        return handler.reject(err);
      }

      manager.set(
        accessToken: d['data']['token'] as String,
        refreshToken: d['data']['token'] as String,
      );
    }

    final retried = await replayer.fetch(
      err.requestOptions
        ..headers = {'Authorization': _getAuth(manager.accessToken as String)},
    );

    if (isFailed(retried)) {
      return handler.reject(err);
    }

    return handler.resolve(err.response!);
  }

  bool isFailed(Response r) {
    final d = r.data;
    return r.statusCode == null ||
        r.statusCode! > 299 ||
        d == null ||
        d is! Map ||
        d['code'] == 666 ||
        d['data'] is! Map;
  }

  String _getAuth(String token) {
    return 'Bearer $token';
  }

  Dio _refresher(RequestOptions o) {
    return Dio(
      BaseOptions(
        baseUrl: o.baseUrl,
        connectTimeout: o.connectTimeout,
        contentType: o.contentType,
        extra: o.extra,
        followRedirects: o.followRedirects,
        headers: o.headers,
        listFormat: o.listFormat,
        maxRedirects: o.maxRedirects,
        method: o.contentType,
        persistentConnection: o.persistentConnection,
        preserveHeaderCase: o.preserveHeaderCase,
        queryParameters: o.queryParameters,
        receiveDataWhenStatusError: o.receiveDataWhenStatusError,
        receiveTimeout: o.receiveTimeout,
        requestEncoder: o.requestEncoder,
        responseDecoder: o.responseDecoder,
        responseType: o.responseType,
        sendTimeout: o.connectTimeout,
        validateStatus: o.validateStatus,
      ),
    );
  }
}
