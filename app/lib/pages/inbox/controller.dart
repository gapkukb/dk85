import 'package:get/get.dart';

import 'index.dart';

class InboxController extends GetxController {
  InboxController();

  final system = true.obs;

  void toggle(bool value) {
    system.value = value;
  }
}
