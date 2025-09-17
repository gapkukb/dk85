import 'dart:async';
import 'dart:math';

import 'package:dio/dio.dart';

import 'http/http.dart';

class User {
  User({required this.name, required this.age, required this.sex});

  final String name;
  final num age;
  final num sex;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(name: json["name"] ?? "", age: json["age"] ?? 0, sex: json["sex"] ?? 0);
  }

  @override
  String toString() {
    return "$name, $age, $sex, ";
  }
}

void main(List<String> args) async {
  final tokenManager = TokenManager();
  tokenManager.update('accessToken', 'refreshToken');
  final http = Http(BaseOptions(baseUrl: 'http://localhost:10010'));
  http.dio
    ..httpClientAdapter = HttpLoadingAdapter(
      onTrigger: (loading) {
        print('loading:${loading}');
      },
    )
    ..transformer = HttpBackgroundTransformer()
    ..interceptors.add(
      ThrowsHttpInterceptor(
        showError: (msg) {
          // print('msg');
        },
      ),
    );

  http.dio.interceptors.insert(
    0,
    HttpAuthInterceptor(
      dio: http.dio,
      tokenManager: tokenManager,
      shouldRefresh: (response) {
        if (response.statusCode == 401) return true;
        return (response.data is Map && response.data['code'] == 666);
      },
      onRefresh: (dio, tokenManager) async {
        final r = await dio.get('/refresh');
        print('-------------');
        print(r);
      },
      onLogin: () {
        print('login');
      },
    ),
  );

  final test1 = http.get('/protected', showLoading: true);
  final test2 = http.get('/long');
  Future wrap() {
    var random = Random();

    return Future.delayed(Duration(milliseconds: random.nextInt(3000)), test1);
  }
}

Stream<Response> getWithCache({
  required Dio dio,
  required RequestOptions options,
  required FutureOr<Response?> Function() loadCache,
  required FutureOr<void> Function(Response) saveCache,
}) async* {
  // 1. 尝试读取缓存
  final cachedResponse = await loadCache();
  if (cachedResponse != null) {
    yield cachedResponse; // 第一次返回：缓存数据
  }

  // 2. 发起网络请求
  try {
    final response = await dio.fetch(options);
    await saveCache(response);
    yield response; // 第二次返回：最新网络数据
  } catch (e) {
    // 根据需要处理错误
    print('网络请求失败: $e');
  }
}

class UseQueryResult {}

UseQueryResult useQuery() {
  return UseQueryResult();
}
