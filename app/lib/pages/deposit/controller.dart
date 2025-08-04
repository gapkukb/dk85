import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DepositController extends GetxController {
  DepositController();

  final amount = "".obs;
  final presets = [2000, 3000, 5000, 10000, 20000];

  final inputController = TextEditingController();

  void setAmount(String value) {
    amount.value = value;
    inputController.text = value;
  }

  void _onInput() {
    amount.value = inputController.value.text;
  }

  @override
  void onInit() {
    super.onInit();
    inputController.addListener(_onInput);
  }

  @override
  void dispose() {
    super.dispose();
    inputController.removeListener(_onInput);
    inputController.dispose();
  }
}
