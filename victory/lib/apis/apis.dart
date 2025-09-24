import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import '../helper/loading.dart';
import '../helper/toast.dart';
import '../http/http.dart';
import '../models/fund_record.model.dart';
import '../models/game_record.model.dart';
import '../models/inbox.model.dart';
import '../models/models.dart' as models;
import '../models/vip.model.dart';
import '../routes/app_pages.dart';
import '../shared/talker/talker.dart';
import '../stores/stores.dart';

part 'helper.dart';
part 'http.dart';
part 'app.api.dart';
part 'auth.api.dart';
part 'game.api.dart';
part 'user.api.dart';
part 'funds.api.dart';

class _Apis {
  final app = _AppApi();
  final auth = _AuthApi();
  final game = _GameApi();
  final user = _UserApi();
  final fund = _FundApi();

  setBaseUrl(String baseUrl) {
    http.dio.options.baseUrl = baseUrl;
  }
}

final apis = _Apis();
