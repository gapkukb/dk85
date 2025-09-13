part of 'http.dart';

class HttpCustomAdpater implements HttpClientAdapter {
  final void Function(bool loading) toggle;
  int _count = 0;
  final HttpClientAdapter _adapter = HttpClientAdapter();

  // final HttpClientAdapter _adapter = IOHttpClientAdapter(
  //   createHttpClient: () {
  //     final client = HttpClient();
  //     client.findProxy = (uri) {
  //       // 将请求代理至 localhost:8888。
  //       // 请注意，代理会在你正在运行应用的设备上生效，而不是在宿主平台生效。
  //       return 'PROXY localhost:8888';
  //     };
  //     client.badCertificateCallback = (X509Certificate cert, String host, int port) => true; //忽略证书
  //     return client;
  //   },
  // );

  HttpCustomAdpater({required this.toggle});

  @override
  Future<ResponseBody> fetch(RequestOptions options, Stream<Uint8List>? requestStream, Future<void>? cancelFuture) {
    if (options.loading && _count++ == 0) toggle(true);

    void close() {
      if (options.loading && --_count == 0) toggle(false);
    }

    return _adapter.fetch(options, requestStream, cancelFuture).whenComplete(close);
  }

  @override
  void close({bool force = false}) {
    _adapter.close(force: force);
  }
}
