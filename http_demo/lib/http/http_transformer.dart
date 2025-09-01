import 'dart:async';

import 'package:dio/dio.dart';
import 'package:http_demo/http/http_options_plugin.dart';

class HttpBackgroundTransformer extends BackgroundTransformer {
  @override
  Future transformResponse(
    RequestOptions options,
    ResponseBody responseBody,
  ) async {
    final body = await super.transformResponse(options, responseBody);
    if (!options.httpOptions.normalizeable) return body;

    if (body is! Map<String, dynamic> ||
        body['code'] != 200 ||
        body['data'] == null) {
      final errorMessage = body is Map
          ? body['message']
          : body is String
          ? body
          : responseBody.statusMessage ?? responseBody;

      throw DioException(
        requestOptions: options,
        response: Response(requestOptions: options, data: body),
        error: errorMessage,
        message: errorMessage,
        type: DioExceptionType.badResponse,
      );
    }

    return body;
  }
}
