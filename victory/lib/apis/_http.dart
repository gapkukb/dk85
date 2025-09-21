part of 'apis.dart';

Http _create() {
  const duration = const Duration(seconds: 10);
  final http = Http(BaseOptions(connectTimeout: duration, sendTimeout: duration, receiveTimeout: duration));

  VoidCallback? cancel;
  http.dio.httpClientAdapter = HttpLoadingAdapter(
    onTrigger: (loading) {
      if (loading) {
        cancel = showLoading();
      } else {
        cancel?.call();
      }
    },
  );

  http.dio.transformer = HttpBackgroundTransformer();

  http.dio.interceptors.add(
    HttpAuthInterceptor(
      dio: http.dio,
      tokenManager: globalTokenManager,
      onLogin: () {
        Get.toNamed(AppRoutes.auth);
      },
    ),
  );

  return http;
}

final http = _create();
