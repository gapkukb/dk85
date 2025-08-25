part of 'index.dart';

/// 编码器
class DecompressHttpInterceptor extends Interceptor {
  final _base64Utf8 = utf8.fuse(base64);

  /// 对请求体进行加密，生成qid等
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final n =
        options.data.hashCode + options.queryParameters.hashCode + timeStamp();
    final qid = _base64Utf8.encode((n.toString()));
    options.headers.putIfAbsent("X-QID", () => qid);
    super.onRequest(options, handler);
  }

  // /// 对响应体解密等
  // @override
  // void onResponse(Response response, ResponseInterceptorHandler handler) {
  //   response.data = ///? TODO:
  //   super.onResponse(response, handler);
  // }
}
