part of 'index.dart';

class NormalizeHttpInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.data['code'] == 200 && (HttpOptions.get(response.requestOptions).normalizable ?? true)) {
      // 对响应体进行拆包
      response.data = response.data['data'];
      super.onResponse(response, handler);
    } else {
      handler.reject(
        DioException(
          requestOptions: response.requestOptions,
          error: response,
          message: response.data['message'],
          response: response,
          stackTrace: StackTrace.current,
          type: DioExceptionType.badResponse,
        ),
      );
    }
  }
}
