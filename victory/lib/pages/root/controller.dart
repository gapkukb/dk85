import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:victory/apis/apis.dart';
import 'package:victory/modals/modals.dart';
import 'package:victory/startup/guide/guide.dart';

class RootController extends GetxController {
  var showFloatingButton = false.obs;
  late final TextEditingController debugger;

  @override
  void onInit() {
    // apis.user.resetLuckySpin(payload: {"activity_id": 19});
    debugger = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
    // 展示引导
    await showGuide();
    VicModals.shared.resume();
  }
}
