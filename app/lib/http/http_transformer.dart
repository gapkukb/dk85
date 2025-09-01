part of 'http.dart';

/// 这一层主要处理数据转换，分流业务层的成功和失败

class HTTPBackgroundTransformer extends BackgroundTransformer {
  @override
  Future transformResponse(
    RequestOptions options,
    ResponseBody responseBody,
  ) async {
    dynamic body = await super.transformResponse(options, responseBody);
    if (options.normalizable == false) return body;
    if (body is String && options.responseType == ResponseType.json) {
      try {
        body = json.decode(body);
        // ignore: empty_catches
      } catch (d) {}
    }
    if (body is! Map<String, dynamic> || body['code'] != 200) {
      final errorMessage = body is Map
          ? body['message'] ?? responseBody.statusMessage
          : body is String
          ? body
          : responseBody.statusMessage;

      throw DioException(
        requestOptions: options,
        response: Response(
          requestOptions: options,
          data: body,
          headers: Headers.fromMap(
            responseBody.headers,
            preserveHeaderCase: options.preserveHeaderCase,
          ),
          statusCode: responseBody.statusCode,
          statusMessage: responseBody.statusMessage,
          extra: responseBody.extra,
          isRedirect: responseBody.isRedirect,
          redirects: responseBody.redirects ?? [],
        ),
        error: errorMessage,
        message: errorMessage,
        type: DioExceptionType.badResponse,
      );
    }

    return body;
  }
}
