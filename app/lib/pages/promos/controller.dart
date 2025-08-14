import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/check_in.dart';
import '../../shared/formatter/date.dart';

class PromosController extends GetxController {
  PromosController();
  final todayKey = GlobalKey();
  final listCtrl = ScrollController();

  List<ModelCheckIn> generate() {
    final now = DateTime.now();
    final today = now.day;
    final days = DateUtils.getDaysInMonth(now.year, now.month);
    return List.generate(days, (index) {
      var state = 3;
      if (index < today) {
        state = 2;
      } else if (index == today) {
        state = 0;
      }
      return ModelCheckIn(amount: 0, date: dateFormatter.format(DateTime(now.year, now.month, index + 1)), status: state);
    });
  }

  final dates = Rx<List<ModelCheckIn>>([]);

  // tap
  void checkin() {
    // Get.snackbar("标题", "消息");
  }

  onTapPromoBanner(int index) {}

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
    dates.value = generate();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      listCtrl.position.ensureVisible(todayKey.currentContext!.findRenderObject()!, alignment: 0.5);
    });
  }

  /// 在 onInit() 之后调用 1 帧。这是进入的理想场所
  @override
  void onReady() {
    super.onReady();
  }

  /// 在 [onDelete] 方法之前调用。
  @override
  void onClose() {
    super.onClose();
  }

  /// dispose 释放内存
  @override
  void dispose() {
    super.dispose();
    listCtrl.dispose();
  }
}
