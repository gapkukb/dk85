import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;
import '../http/http.dart';
import '../iconfont/iconfont.dart';
import '../mixins/audio.mixin.dart';
import '../mixins/locale.mixin.dart';
import '../mixins/router.mixin.dart';
import '../routes/app_pages.dart';

part 'app.service.dart';
part 'game.service.dart';
part 'auth.service.dart';
part 'user.service.dart';

class _Services {
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

final services = _Services();
