import 'package:app/apis/apis.dart';
import 'package:app/models/top_up.model.dart';
import 'package:app/models/withdrawal.model.dart';
import 'package:app/routes/app_pages.dart';
import 'package:app/services/index.dart';
import 'package:app/views/funds/widgets/funds_fill_deposit.dart';
import 'package:app/views/funds/widgets/funds_fill_withdraw.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FundsController extends GetxController with GetSingleTickerProviderStateMixin {
  final topUpChannels = <TopUpModel>[].obs;
  final withdrawChannels = <WithdrawlModel>[].obs;
  final amount = ''.obs;
  final ctrl = TextEditingController();
  late final TabController tab;

  /// 提款金额控制器
  final withdrawAmountCtrl = TextEditingController();

  openDepositChannel(TopUpModel channel) {
    Get.bottomSheet(FundsFillDeposit(channel), isScrollControlled: true);
  }

  deposit() {
    Get.toNamed(Routes.payee);
  }

  openWithdrawChannel(WithdrawlModel channel) {
    Get.bottomSheet(FundsFillWithdraw(channel), isScrollControlled: true);
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
    final channles = await fundApi.queryTopUpList();
    topUpChannels.value = channles.data.the2.accountList;
  }

  void queryWithdrawChannels() async {
    final channles = await fundApi.queryWithdrawList();
    withdrawChannels.value = channles.data;
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
