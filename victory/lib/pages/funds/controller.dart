import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:victory/apis/apis.dart';
import 'package:victory/models/models.dart';
import 'package:victory/routes/app_pages.dart';
import 'package:victory/services/services.dart';
import 'package:victory/pages/funds/widgets/deposit_filling.dart';
import 'package:victory/pages/funds/widgets/withdrawal_filling.dart';

class FundsController extends GetxController with GetSingleTickerProviderStateMixin {
  final channelsDeposit = <VicDepositChannelModel>[].obs;
  final channelsWithdrawal = <VicWithdrawalChannelModel>[].obs;
  final amount = ''.obs;
  final ctrl = TextEditingController();
  late final TabController tab;

  /// 提款金额控制器
  final withdrawAmountCtrl = TextEditingController();

  openDepositChannel(VicDepositChannelModel channel) async {
    services.app.playTopUpAudio();
    await Get.bottomSheet(VicDepositFilling(channel), isScrollControlled: true);
    services.app.playBackgroundAudio();
  }

  openWithdrawChannel(VicWithdrawalChannelModel channel) async {
    services.app.playTopUpAudio();
    await Get.bottomSheet(VicWithdrawalFilling(channel), isScrollControlled: true);
    services.app.playBackgroundAudio();
  }

  deposit() {
    Get.toNamed(AppRoutes.payee);
  }

  withdraw() {}
  withdrawAll() {
    withdrawAmountCtrl.text = services.user.balance.toString();
  }

  void setAmount(String n) {
    amount.value = n;
    ctrl.text = n;
  }

  void _onInput() {
    amount.value = ctrl.value.text;
  }

  void queryTopUpChannels() async {
    final r = await apis.fund.queryDepositChannels();
    if (r == null) return;
    channelsDeposit.value = r.map((e) => e.accountList.first).where((i) => i != null).toList();
  }

  void queryWithdrawChannels() async {
    channelsWithdrawal.value = await apis.fund.queryWithdrawalChannels() ?? [];
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
