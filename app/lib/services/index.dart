library;

import 'package:app/iconfont/index.dart';
import 'package:app/views/funds/funds_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/storage/index.dart';
import 'package:app/modal_views/guide/guide.dart' as guide;

part 'app.service.dart';
part 'main.service.dart';
part 'game.service.dart';
part 'user.service.dart';
part 'auth.service.dart';

void setupServices() {
  Get.put(TabsService());
  Get.put(AuthService());
  Get.put(AppService());
}
