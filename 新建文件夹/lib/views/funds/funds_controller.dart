import 'package:app/views/funds/widgets/funds_deposit_fill.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FundsController extends GetxController {
  final depositChannels = [].obs;
  final withdrawChannels = [].obs;
  final presets = [2000, 3000, 5000, 10000, 20000].obs;
  final amount = ''.obs;
  final ctrl = TextEditingController();

  openDepositChannel(int index) {
    Get.bottomSheet(FundsDepositFill(), isScrollControlled: true);
  }

  deposit() {
    Get.bottomSheet(FundsDepositFill(), isScrollControlled: true);
  }

  openWithdrawChannel(int index) {
    Get.bottomSheet(FundsDepositFill(), isScrollControlled: true);
  }

  withdraw() {}

  void setAmount(String n) {
    amount.value = n;
    ctrl.text = n;
  }

  void _onInput() {
    amount.value = ctrl.value.text;
  }

  @override
  void onInit() {
    super.onInit();
    ctrl.addListener(_onInput);
  }

  @override
  void dispose() {
    super.dispose();
    ctrl.removeListener(_onInput);
    ctrl.dispose();
  }
}
