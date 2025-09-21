import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../shared/dialog/dialog.dart';
import '../../shared/input_graphic/input_graphic.dart';

class VicAuthCotroller extends GetxController with VicGraphicInputController {
  final pwd = TextEditingController();
  final rememberMe = false.obs;

  remember(bool? value) {
    rememberMe.value = value ?? !rememberMe.value;
  }

  Future action({required String text, required Future Function() todo}) async {
    try {
      BotToast.showLoading();
      await todo();
      BotToast.closeAllLoading();
      VicDialog.success(text: text, onClose: Get.back);
    } catch (e) {
      refreshImage();
      BotToast.closeAllLoading();
      rethrow;
    } finally {}
  }

  @override
  void onClose() {
    pwd.dispose();
    super.onClose();
  }
}
