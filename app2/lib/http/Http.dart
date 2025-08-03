part of 'index.dart';

final dio = Dio(BaseOptions());

typedef HttpFactory<T> = Future<Response<T>> Function(Map<String, dynamic>? payload, {bool loading, bool silent, Options? options});

void configureDio() {
  dio.options.baseUrl = 'https://api.pub.dev';
  dio.options.connectTimeout = const Duration(seconds: 5);
  dio.options.receiveTimeout = const Duration(seconds: 3);
  dio.options.responseType = ResponseType.json;
}

HttpFactory<T> get<T>(String path, {bool loading = false, bool silent = false, Options? options}) {
  return (Map<String, dynamic>? payload, {bool loading = false, bool silent = false, Options? options}) {
    options ??= Options();
    options.extra ??= {};
    options.extra!.addAll({"loading": loading, "silent": silent});

    return dio.get(path, options: options, queryParameters: payload, data: payload);
  };
}

void main(List<String> args) {
  final queryUser = get("/user");
  final user = queryUser(null);
}
