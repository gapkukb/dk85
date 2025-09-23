import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../apis/apis.dart';
import '../../models/models.dart';
import '../../routes/app_pages.dart';
import '../../stores/stores.dart';
import 'widgets/deposit_filling.dart';
import 'widgets/withdrawal_filling.dart';

class FundsController extends GetxController with GetSingleTickerProviderStateMixin {
  final channelsDeposit = <VicDepositChannelModel>[].obs;
  final channelsWithdrawal = <VicWithdrawalChannelModel>[].obs;
  final amount = ''.obs;
  final ctrl = TextEditingController();
  late final TabController tab;

  /// 提款金额控制器
  final withdrawAmountCtrl = TextEditingController();

  openDepositChannel(VicDepositChannelModel channel) async {
    stores.app.playTopUpAudio();
    await Get.bottomSheet(VicDepositFilling(channel), isScrollControlled: true);
    stores.app.playBackgroundAudio();
  }

  openWithdrawChannel(VicWithdrawalChannelModel channel) async {
    stores.app.playTopUpAudio();
    await Get.bottomSheet(VicWithdrawalFilling(channel), isScrollControlled: true);
    stores.app.playBackgroundAudio();
  }

  deposit() {
    Get.toNamed(AppRoutes.payee);
  }

  withdraw() {}
  withdrawAll() {
    withdrawAmountCtrl.text = stores.user.balance.toString();
  }

  void setAmount(String n) {
    amount.value = n;
    ctrl.text = n;
  }

  void _onInput() {
    amount.value = ctrl.value.text;
  }

  void queryTopUpChannels() async {
    final r = await Apis.fund.queryDepositChannels();
    channelsDeposit.value = r.map((e) => e.accountList.first).where((i) => i != null).toList();
  }

  void queryWithdrawChannels() async {
    channelsWithdrawal.value = await Apis.fund.queryWithdrawalChannels() ?? [];
  }

  @override
  void onInit() {
    super.onInit();
    tab = TabController(length: 2, vsync: this);
    ctrl.addListener(_onInput);
    queryTopUpChannels();
    queryWithdrawChannels();
  }

  @override
  void onClose() {
    super.onClose();
    ctrl.removeListener(_onInput);
    tab.dispose();
    ctrl.dispose();
  }
}
