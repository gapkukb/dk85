library;

import 'dart:async';
import 'package:app/apis/apis.dart';
import 'package:app/dialogs/dialogs.dart';
import 'package:app/http/index.dart';
import 'package:app/mixins/audio.mixin.dart';
import 'package:app/mixins/home_view.mixin.dart';
import 'package:app/models/announcement.model.dart';
import 'package:app/models/balance.model.dart';
import 'package:app/models/game.model.dart';
import 'package:app/models/user_info.model.dart';
import 'package:app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/storage/storage.dart';

part 'app.service.dart';
part 'game.service.dart';
part 'user.service.dart';
part 'auth.service.dart';

class _Services {
  final auth = _AuthService();
  final app = _AppService();
  final user = _UserService();
  final game = _GameService();
  final dialogs = Dialogs();

  Future initialize() async {
    Get.put(auth);
    Get.put(app);
    Get.put(user);
    Get.put(game);
    Get.put(dialogs);

    if (auth.authorized) {
      user.queryBalance();
      return user.queryUserInfo();
    }
    // 快速注册
    return auth.fastRegister();
  }
}

final services = _Services();
