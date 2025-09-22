import 'package:dio/dio.dart';

typedef HttpDispatch<T> =
    Future<T> Function({
      Object? payload,
      Object? data,
      Map<String, dynamic>? queryParameters,
      CancelToken? cancelToken,
      Options? options,
      void Function(int, int)? onSendProgress,
      void Function(int, int)? onReceiveProgress,
    });

typedef UnionHttpMethod =
    HttpDispatch<R> Function<R, T>(
      String path, {
      bool? loading,
      bool? silent,
      bool? throwable,
      bool? normalize,
      int? retry,
      T Function(Map<String, dynamic> json)? decoder,
    });

typedef MapHttpMethod =
    HttpDispatch<R> Function<R>(
      String path, {
      bool? loading,
      bool? silent,
      bool? throwable,
      bool? normalize,
      int? retry,
      R Function(Map<String, dynamic> json)? decoder,
    });

typedef ListHttpMethod =
    HttpDispatch<List<R>> Function<R>(
      String path, {
      bool? loading,
      bool? silent,
      bool? throwable,
      bool? normalize,
      int? retry,
      R Function(Map<String, dynamic> json)? decoder,
    });

class Http {
  late final Dio dio;
  late final MapHttpMethod get;
  late final ListHttpMethod getList;
  late final MapHttpMethod post;
  late final ListHttpMethod postList;

  Http(BaseOptions options) {
    dio = Dio(options);
    get = _MapFetch(dio, 'get');
    post = _MapFetch(dio, 'post');
    getList = _listFetch(dio, 'get');
    postList = _listFetch(dio, 'post');
  }
}

UnionHttpMethod _UnionFetch(Dio dio, String method) {
  return <R, T>(path, {loading, silent, throwable, normalize, retry, decoder}) {
    return ({payload, data, queryParameters, cancelToken, options, onSendProgress, onReceiveProgress}) {
      return dio
          .request(
            path,
            options: options,
            data: data,
            queryParameters: queryParameters,
            onSendProgress: onSendProgress,
            onReceiveProgress: onReceiveProgress,
          )
          .then<R>((
            response,
          ) {
            final data = response.data['data'];
            if (decoder == null) return data;
            if (data is Map<String, dynamic>) return decoder(data) as R;
            if (data is List) return List<T>.from(data.map((x) => decoder(x))) as R;
            return data;
          });
    };
  };
}

MapHttpMethod _MapFetch(Dio dio, String method) {
  return <R>(path, {loading, silent, throwable, normalize, retry, decoder}) {
    return _UnionFetch(dio, method)<R, R>(
      path,
      loading: loading,
      silent: silent,
      throwable: throwable,
      normalize: normalize,
      retry: retry,
      decoder: decoder,
    );
  };
}

ListHttpMethod _listFetch(Dio dio, String method) {
  return <R>(path, {loading, silent, throwable, normalize, retry, decoder}) {
    return _UnionFetch(dio, method)<List<R>, R>(
      path,
      loading: loading,
      silent: silent,
      throwable: throwable,
      normalize: normalize,
      retry: retry,
      decoder: decoder,
    );
  };
}

class User {
  const User();
  factory User.fromJson(Map<String, dynamic> json) => const User();
}

void main(List<String> args) async {
  final http = Http(BaseOptions(baseUrl: 'http://localhost:10010'));

  final a = http.get('/user', decoder: User.fromJson);
  final b = http.getList('/users', decoder: User.fromJson);

  final c = await a();
  final d = await b();
  print(c);
  print(d);
}
