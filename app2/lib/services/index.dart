library;

import 'package:get/get.dart';

import 'app_service.dart';
import 'user_service.dart';

export './app_service.dart';
export './user_service.dart';

void setupServices() {
  Get.put(AppService());
  Get.put(UserService());
}
