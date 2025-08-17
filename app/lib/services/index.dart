library;

import 'package:get/get.dart';

import 'app.service.dart';
import 'game.service.dart';
import 'user.service.dart';
import 'auth.service.dart';

export 'app.service.dart';
export 'user.service.dart';
export 'game.service.dart';
export 'auth.service.dart';

void setupServices() {
  Get.put(AppService());
  Get.put(AuthService());
  Get.put(GameService());
  Get.put(UserService());
}
