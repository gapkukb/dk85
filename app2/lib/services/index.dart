library;

import 'package:get/get.dart';

import 'app_service.dart';

export './app_service.dart';

void initializeServices() {
  Get.put(AppService());
}
