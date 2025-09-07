library;

import 'dart:async';

import 'package:app/apis/apis.dart';
import 'package:app/http/index.dart';
import 'package:app/iconfont/index.dart';
import 'package:app/models/balance.model.dart';
import 'package:app/models/game.model.dart';
import 'package:app/models/user_info.model.dart';
import 'package:app/routes/app_pages.dart';
import 'package:app/views/funds/funds_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/storage/storage.dart';
import 'package:app/modal_views/guide/guide.dart' as guide;

part 'app.service.dart';
part 'main.service.dart';
part 'game.service.dart';
part 'user.service.dart';
part 'auth.service.dart';

class _Services {
  final auth = _AuthService();
  final app = _AppService();
  final user = _UserService();
  final game = _GameService();
  Future initialize() async {
    Get.put(auth);
    Get.put(app);
    Get.put(user);
    Get.put(game);

    if (auth.authorized) {
      user.queryBalance();
      return user.queryUserInfo();
    }
  }
}

final services = _Services();
