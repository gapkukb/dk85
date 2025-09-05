library;

import 'dart:async';

import 'package:app/apis/apis.dart';
import 'package:app/http/index.dart';
import 'package:app/iconfont/index.dart';
import 'package:app/models/game.model.dart';
import 'package:app/models/user_info.model.dart';
import 'package:app/routes/app_pages.dart';
import 'package:app/views/funds/funds_controller.dart';
import 'package:app/views/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/storage/storage.dart';
import 'package:app/modal_views/guide/guide.dart' as guide;

part 'app.service.dart';
part 'main.service.dart';
part 'game.service.dart';
part 'user.service.dart';
part 'auth.service.dart';

abstract class Services {
  static void initialize() {
    Get.put(AuthService());
    Get.put(AppService());
    Get.put(UserService());
    Get.put(GameService());
  }
}
