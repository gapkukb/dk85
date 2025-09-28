import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'package:victory/shared/dialogs/dialog.dart';
import 'package:victory/shared/input_graphic/input_graphic.dart';
import 'package:victory/services/services.dart';

class VicAuthCotroller extends GetxController with VicGraphicInputController {
  final pwd = TextEditingController();
  final rememberMe = false.obs;

  remember(bool? value) {
    rememberMe.value = value ?? !rememberMe.value;
  }

  void login(Object values) async {
    try {
      await services.auth.login(values);
      Get.back();
    } catch (e) {
      refreshImage();
      rethrow;
    }
  }

  void register(Object values) async {
    try {
      await services.auth.register(values);
      Get.back();
    } catch (e) {
      refreshImage();
      rethrow;
    }
  }

  @override
  void onClose() {
    pwd.dispose();
    super.onClose();
  }
}
