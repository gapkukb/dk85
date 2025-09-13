import 'package:bot_toast/bot_toast.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'http.dart';

final authManager = HttpAuthManager();
final __dio = Dio(BaseOptions(baseUrl: 'http://mdgametest.xyz'));

final _dio = __dio
  ..httpClientAdapter = HttpCustomAdpater(toggle: (loading) => loading ? BotToast.showLoading() : BotToast.closeAllLoading())
  ..transformer = HTTPBackgroundTransformer()
  ..interceptors.add(PrettyDioLogger(requestBody: true, responseBody: true))
  ..interceptors.add(HttpPreprocessInterceptor())
  ..interceptors.add(HttpAuthInterceptor(__dio, authManager))
  ..interceptors.add(HttpErrorsInterceptor((msg) => BotToast.showText(text: msg)));

final http = Http(_dio);
