import 'package:get/get.dart';

import 'dialog_impl.dart';

abstract class VicDialog {
  static Future<void> alert({
    String? title,
    String? content,
  }) async {
    Get.dialog(
      const VicDialogView.alert(
        content: 'you will enter the game',
      ),
      barrierDismissible: false,
    );
  }

  static Future<void> confirm({String? title}) async {
    Get.dialog(
      const VicDialogView.confirm(
        content: 'you will enter the game',
      ),
      barrierDismissible: false,
    );
  }

  static Future<void> prompt() async {}
}
