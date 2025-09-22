part of 'http.dart';

class HttpLoadingAdapter implements HttpClientAdapter {
  HttpLoadingAdapter({required this.onTrigger});
  void Function(bool loading) onTrigger;
  final HttpClientAdapter _adapter = HttpClientAdapter();
  int _count = 0;

  @override
  Future<ResponseBody> fetch(RequestOptions options, Stream<Uint8List>? requestStream, Future<void>? cancelFuture) {
    final showable = options.custom.loading;
    if (showable && _count++ == 0) {
      onTrigger(true);
    }
    return _adapter.fetch(options, requestStream, cancelFuture).whenComplete(() {
      if (showable && --_count == 0) {
        onTrigger(false);
      }
    });
  }

  @override
  void close({bool force = false}) {
    _adapter.close(force: force);
  }
}
