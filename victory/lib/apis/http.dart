part of 'apis.dart';

VicHttp _create() {
  const duration = Duration(seconds: 30);
  final http = VicHttp(BaseOptions(connectTimeout: duration, sendTimeout: duration, receiveTimeout: duration));

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
  http.dio.interceptors.add(HeadersHttpInterceptor());
  http.dio.interceptors.add(
    HttpAuthInterceptor(
      dio: http.dio,
      tokenManager: globalTokenManager,
      onLogin: () {
        Get.toNamed(AppRoutes.auth);
      },
    ),
  );
  http.dio.interceptors.add(
    ShowErrorsHttpInterceptor(
      showError: (msg) => toast(msg),
    ),
  );
  // http.dio.interceptors.add(
  //   TalkerDioLogger(
  //     talker: talker,
  //     settings: TalkerDioLoggerSettings(
  //       printRequestHeaders: true,
  //       printResponseHeaders: true,
  //       printResponseMessage: true,
  //       requestFilter: (options) => options.custom.debug,
  //       responseFilter: (response) => response.requestOptions.custom.debug,
  //     ),
  //   ),
  // );

  return http;
}

final http = _create();
