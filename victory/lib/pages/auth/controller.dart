import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../shared/dialog/dialog.dart';
import '../../shared/input_graphic/input_graphic.dart';
import '../../stores/stores.dart';

class VicAuthCotroller extends GetxController with VicGraphicInputController {
  final pwd = TextEditingController();
  final rememberMe = false.obs;

  remember(bool? value) {
    rememberMe.value = value ?? !rememberMe.value;
  }

  void login(Object values) async {
    await stores.auth.login(values);
    VicDialog.success(text: 'Log In successful', onClose: stores.app.toHomePage);
  }

  void register(Object values) async {
    await stores.auth.register(values);
    VicDialog.success(text: 'Log In successful', onClose: Get.back);
  }

  Future action({required String text, required Future Function() todo}) async {
    try {
      await todo();
      VicDialog.success(text: text, onClose: Get.back);
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
