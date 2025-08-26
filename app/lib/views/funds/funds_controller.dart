import 'package:app/routes/app_pages.dart';
import 'package:app/views/funds/widgets/funds_fill_deposit.dart';
import 'package:app/views/funds/widgets/funds_fill_withdraw.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FundsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final depositChannels = [].obs;
  final withdrawChannels = [].obs;
  final presets = [2000, 3000, 5000, 10000, 20000].obs;
  final amount = ''.obs;
  final ctrl = TextEditingController();
  late final TabController tab;

  /// 提款金额控制器
  final withdrawAmountCtrl = TextEditingController();

  openDepositChannel(int index) {
    Get.bottomSheet(FundsFillDeposit(), isScrollControlled: true);
  }

  deposit() {
    Get.toNamed(Routes.receiption);
  }

  openWithdrawChannel(int index) {
    Get.bottomSheet(FundsFillWithdraw(), isScrollControlled: true);
  }

  withdraw() {}
  withdrawAll() {
    withdrawAmountCtrl.text = '1000';
  }

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
    tab = TabController(length: 2, vsync: this);
    ctrl.addListener(_onInput);
  }

  @override
  void onClose() {
    super.dispose();
    ctrl.removeListener(_onInput);
    tab.dispose();
    ctrl.dispose();
  }
}
