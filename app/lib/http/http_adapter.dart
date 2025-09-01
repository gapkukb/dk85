part of 'http.dart';

class HttpCustomAdpater implements HttpClientAdapter {
  final void Function(bool loading) toggle;
  int _count = 0;
  final HttpClientAdapter _adapter = HttpClientAdapter();

  HttpCustomAdpater({required this.toggle});

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) {
    if (options.loading && _count++ == 0) toggle(true);

    void close() {
      if (options.loading && --_count == 0) toggle(false);
    }

    return _adapter
        .fetch(options, requestStream, cancelFuture)
        .whenComplete(close);
  }

  @override
  void close({bool force = false}) {
    _adapter.close(force: force);
  }
}
