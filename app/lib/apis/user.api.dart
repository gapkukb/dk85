import 'package:dio/dio.dart';
import 'package:flutter_application_1/models/model.dart';

import '/http/http.dart';

final login = get('/login', LoginVo.fromJson);
final refreshToken = get('/refresh', RefreshVo.fromJson);
final queryUser = get('/user');
// final queryUser = () {
//   Dio(BaseOptions(baseUrl: 'http://localhost:9000')).get('/user');
// };
