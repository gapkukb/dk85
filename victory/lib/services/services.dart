import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get_storage/get_storage.dart';
import 'package:victory/apis/apis.dart';
import 'package:victory/constants/lucky_spin.dart';
import 'package:victory/extensions/string.extension.dart';
import 'package:victory/http/http.dart';
import 'package:victory/mixins/audio.mixin.dart';
import 'package:victory/mixins/locale.mixin.dart';
import 'package:victory/mixins/router.mixin.dart';
import 'package:victory/modals/modals.dart';
import 'package:victory/models/models.dart';
import 'package:victory/routes/app_pages.dart';
import 'package:victory/shared/app_info/app_info.dart';
import 'package:victory/shared/dialogs/dialog.dart';
import 'package:victory/shared/logger/logger.dart';
import 'package:victory/shared/talker/talker.dart';
import 'package:victory/storage/storage.dart';

part 'app.store.dart';
part 'game.store.dart';
part 'auth.store.dart';
part 'user.store.dart';

class _services {
  late final _AuthService auth;
  late final _AppService app;
  late final _GameService game;
  late final _UserService user;

  Future ensureInitialized() async {
    auth = _AuthService();
    app = _AppService();
    game = _GameService();
    user = _UserService();
    final modals = VicModals();
    Get.put(auth);
    Get.put(app);
    Get.put(game);
    Get.put(user);
    Get.put(modals);

    return Future.wait([
      auth.ensureInitialized(),
      app.ensureInitialized(),
      game.ensureInitialized(),
      user.ensureInitialized(),
      modals.ensureInitialized(),
    ]);
  }
}

final services = _services();
