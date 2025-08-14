import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DepositController extends GetxController {
  DepositController();

  final amount = "".obs;
  final presets = [2000, 3000, 5000, 10000, 20000];

  final amountCtrl = TextEditingController();

  void setAmount(String value) {
    amount.value = value;
    amountCtrl.text = value;
  }

  void _onInput() {
    amount.value = amountCtrl.value.text;
  }

  @override
  void onInit() {
    super.onInit();
    amountCtrl.addListener(_onInput);
  }

  @override
  void dispose() {
    super.dispose();
    amountCtrl.removeListener(_onInput);
    amountCtrl.dispose();
  }
}
