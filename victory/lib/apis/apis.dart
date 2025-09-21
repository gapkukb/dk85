import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import '../helper/loading.dart';
import '../http/http.dart';
import '../models/auth.dart';
import '../models/banner.dart';
import '../models/models.dart';
import '../models/models.dart' as models;
import '../models/user.model.dart';
import '../routes/app_pages.dart';
import '../stores/stores.dart';
part '_http.dart';
part 'app.api.dart';
part 'auth.api.dart';
part 'game.api.dart';
part 'user.api.dart';

abstract class Apis {
  static final app = _AppApi();
  static final auth = _AuthApi();
  static final game = _GameApi();
  static final user = _UserApi();
}
