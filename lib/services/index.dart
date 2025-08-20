library;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jjj/services/app_service.dart';

part 'tabs_service.dart';
part 'auth_service.dart';

void setupServices() {
  Get.put(TabsService());
  Get.put(AuthService());
  Get.put(AppService());
}
