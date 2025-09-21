import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;
import '../apis/apis.dart';
import '../http/http.dart';
import '../iconfont/iconfont.dart';
import '../mixins/audio.mixin.dart';
import '../mixins/auth.mixin.dart';
import '../mixins/locale.mixin.dart';
import '../mixins/router.mixin.dart';
import '../models/models.dart';
import '../models/user.model.dart';
import '../routes/app_pages.dart';
import '../storage/storage.dart';

part 'app.store.dart';
part 'game.store.dart';
part 'auth.store.dart';
part 'user.store.dart';

class _Stores {
  late final _AuthService auth;
  late final _AppService app;
  late final _GameService game;
  late final _UserService user;

  Future initialize() async {
    auth = _AuthService();
    app = _AppService();
    game = _GameService();
    user = _UserService();

    Get.put(auth);
    Get.put(app);
    Get.put(game);
    Get.put(user);

    return Future.wait([auth.initialize(), app.initialize(), game.initialize(), user.initialize()]);
  }
}

final stores = _Stores();
