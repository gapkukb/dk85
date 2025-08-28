import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_application_1/http/http_refresh_token.dart';
part 'http_options.dart';
part '/http/http_error_plugin.dart';
part '/http/http_loading_plugin.dart';
part '/http/http_transformer.dart';
part 'http_dispatcher.dart';

const duration = Duration(seconds: 30);

final http =
    Dio(
        BaseOptions(
          baseUrl: 'http://localhost:9000',
          connectTimeout: duration,
          receiveTimeout: duration,
          // sendTimeout: duration,
          responseType: ResponseType.json,
          contentType: ContentType.json.mimeType,
        ),
      )
      ..transformer = HTTPBackgroundTransformer()
      ..interceptors.add(HttpRefreshToken())
      ..interceptors.add(HttpLoadingPlugin())
      ..interceptors.add(HttpErrorPlugin());

final get = HttpMethod(http, 'get');
final post = HttpMethod(http, 'post');

void main(List<String> args) async {
  final querUser = get(
    '/user',
    null,
    HttpOptions(loading: true),
    Options(extra: {'aaaa': '123'}),
  );

  final querUser2 = get.list('/users');

  final user = await querUser();
  final user2 = await querUser2();

  // print(user);
  // print(user2);
  // print(user.length);

  // await Future.wait([
  //   http.get('/user', data: {'': '13800138000', 'password': '123456'}),
  //   http.get('/user', data: {'': '13800138000', 'password': '123456'}),
  //   http.get('/user', data: {'': '13800138000', 'password': '123456'}),
  //   http.get('/user', data: {'': '13800138000', 'password': '123456'}),
  // ]);
}
