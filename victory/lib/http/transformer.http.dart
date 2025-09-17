part of 'http.dart';

class HttpBackgroundTransformer extends BackgroundTransformer {
  final String code;
  final String message;
  final String data;
  HttpBackgroundTransformer({this.code = 'code', this.message = 'message', this.data = 'data'});
  @override
  // Future<String> transformRequest(RequestOptions options) async {
  //   if (options.data is List<String>) {
  //     throw DioException(error: "Can't send List to sever directly", requestOptions: options);
  //   } else {
  //     return super.transformRequest(options);
  //   }
  // }
  @override
  Future transformResponse(RequestOptions options, ResponseBody responseBody) {
    return super.transformResponse(options, responseBody).then((body) {
      if (!options.custom.normalizable || options.responseType != ResponseType.json) return body;
      // {code:200,message:string,data:any}
      if (body is Map && body[code] == 200) {
        if (body[data] is List && body[data].isEmpty) {
          body.remove(data);
        }
        return body;
      }
      final msg = _extract(body, responseBody);

      final response = Response(
        data: body,
        headers: Headers.fromMap(responseBody.headers, preserveHeaderCase: options.preserveHeaderCase),
        requestOptions: options,
        statusCode: responseBody.statusCode,
        isRedirect: responseBody.isRedirect,
        redirects: responseBody.redirects ?? [],
        statusMessage: responseBody.statusMessage,
        extra: responseBody.extra,
      );

      throw DioException(
        requestOptions: options,
        type: DioExceptionType.badResponse,
        response: response,
        message: msg ?? responseBody.statusCode.toString(),
        error: responseBody.statusCode.toString(),
      );
    });
  }

  String? _extract(dynamic body, ResponseBody responseBody) {
    if (body is String) return body;
    if (body is! Map) return '无法解析的response body:${body.toString()}';
    return body['message'];
  }
}
