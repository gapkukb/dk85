import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:victory/helper/loading.dart';
import 'package:victory/helper/toast.dart';
import 'package:victory/http/http.dart';
import 'package:victory/models/announcement.model.dart';
import 'package:victory/models/daily_check_in.model.dart';
import 'package:victory/models/fund_record.model.dart';
import 'package:victory/models/game_record.model.dart';
import 'package:victory/models/inbox.model.dart';
import 'package:victory/models/models.dart' as models;
import 'package:victory/models/vip.model.dart';
import 'package:victory/routes/app_pages.dart';
import 'package:victory/shared/talker/talker.dart';
import 'package:victory/services/services.dart';

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
