import 'package:get/get.dart';

import 'dialog_impl.dart';

abstract class VicDialog {
  static Future<void> alert({
    String? title,
    String? content,
  }) async {
    Get.dialog(const VicDialogView());
  }

  static Future<void> confirm({String? title}) async {}
  static Future<void> prompt() async {}
}
