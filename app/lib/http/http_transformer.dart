part of 'http.dart';

/// 简化后端的返回值，将{code:200,message:'',data:'’} 格式在成功时直接返回data
/// 后面的拦截器onresponse返回值也会发生变化

class HTTPBackgroundTransformer extends BackgroundTransformer {
  @override
  Future transformResponse(
    RequestOptions options,
    ResponseBody responseBody,
  ) async {
    final body = await super.transformResponse(options, responseBody);
    if (options.normalizable == false) return body;
    if (body is Map && body['code'] != 200) {
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
        error: body['message'],
        message: body['message'],
        type: DioExceptionType.badResponse,
      );
    }
    return body['data'];
  }
}
