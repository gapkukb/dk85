part of 'http.dart';

/// 简化后端的返回值，将{code:200,message:'',data:'’} 格式在成功时直接返回data
/// 后面的拦截器onresponse返回值也会发生变化

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
