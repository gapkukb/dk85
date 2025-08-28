import 'dart:convert';
import 'dart:math';
import 'package:dio/dio.dart';

class TokenManager {
  String? accessToken;
  String? refreshToken;

  TokenManager(this.accessToken, this.refreshToken);
}

final tokenManager = TokenManager(null, null);

String qid() {
  return base64Encode(
    utf8.encode(
      (Random().nextDouble() * DateTime.now().microsecond).toString(),
    ),
  );
}

class HttpRefreshToken extends QueuedInterceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers.addAll({
      'Authorization': tokenManager.accessToken,
      'Accept-Language': 'my;q=0.9,en;q=0.8,zh;q=0.7',
      // 'X-Client': Platform.operatingSystem,
      'X-SiteId': 1,
      'X-Qid': qid(),
    });

    // await Completer().future;

    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // TODO: implement onError
    super.onError(err, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // TODO: implement onResponse
    super.onResponse(response, handler);
  }
}
