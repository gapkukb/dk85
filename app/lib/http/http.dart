import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:bot_toast/bot_toast.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

part 'http_options.dart';
part 'http_error_plugin.dart';
part 'http_loading_plugin.dart';
part 'http_transformer.dart';
part 'http_dispatcher.dart';
part 'http_token_manager_interceptor.dart';

const duration = Duration(seconds: 30);
final _dio = Dio(
  BaseOptions(
    baseUrl: 'https://jjj2.com',
    connectTimeout: duration,
    receiveTimeout: duration,
    // sendTimeout: duration,
    responseType: ResponseType.json,
    contentType: ContentType.json.mimeType,
  ),
);
final tokenMangerInterceptor = HttpTokenManagerInterceptor(
  dio: _dio,
  onRefresh: (dio, manager) async {
    final resp = await dio.post('/refresh-token');
  },
  shouldRefresh: (response) {
    if (response == null) return false;
    return response.statusCode == 401 ||
        response.statusCode == 403 ||
        (response.data is Map && response.data['code'] == 666);
  },
  setAuthHeader: (manager) {
    if (manager.accessToken == null) return null;
    return {HttpHeaders.authorizationHeader: 'Bearer ${manager.accessToken}'};
  },
);
final http = _dio
  ..transformer = HTTPBackgroundTransformer()
  ..interceptors.add(
    PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      compact: false,
    ),
  )
  ..interceptors.add(tokenMangerInterceptor)
  // ..interceptors.add(HttpLoadingPlugin())
  ..interceptors.add(HttpErrorPlugin());

final get = HttpMethod(http, 'get');
final post = HttpMethod(http, 'post');
