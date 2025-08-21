library;

import 'package:app/iconfont/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/storage/index.dart';

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
