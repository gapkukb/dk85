import 'package:app/extensions/bot_toast.dart';
import 'package:app/widgets/input_graphic/input_graphic.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AuthCotroller extends GetxController with AKGraphicInputController {
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
      showSuccess(text: text, onClose: Get.back);
    } catch (e) {
      refreshImage();
      BotToast.closeAllLoading();
    } finally {}
  }

  @override
  void onClose() {
    pwd.dispose();
    super.onClose();
  }
}
