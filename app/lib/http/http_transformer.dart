part of 'http.dart';

/// 简化后端的返回值，将{code:200,message:'',data:'’} 格式在成功时直接返回data
/// 后面的拦截器onresponse返回值也会发生变化

class HTTPBackgroundTransformer extends BackgroundTransformer {
  @override
  Future transformResponse(
    RequestOptions options,
    ResponseBody responseBody,
  ) async {
    return super.transformResponse(options, responseBody);
    // print('999999999999');
    // return body;
    // if (options.normalizable == false) return body;
    // if (body is Map && body['code'] != 200) {
    //   throw DioException(
    //     requestOptions: options,
    //     response: Response(requestOptions: options, data: body),
    //     error: body['message'],
    //     message: body['message'],
    //     type: DioExceptionType.badResponse,
    //   );
    // }
    // return body['data'];
  }
}
