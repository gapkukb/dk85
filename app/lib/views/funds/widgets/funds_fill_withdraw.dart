import 'package:app/iconfont/index.dart';
import 'package:app/shared/amount/amount.dart';
import 'package:app/shared/customer_service/customer_service.dart';
import 'package:app/theme/index.dart';
import 'package:app/views/funds/funds_controller.dart';
import 'package:app/widgets/button/index.dart';
import 'package:app/widgets/input_base/input_base.dart';
import 'package:app/widgets/network_picture.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class FundsFillWithdraw extends GetView<FundsController> {
  const FundsFillWithdraw({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          buildContent(),
          AKButton(
            height: AKButton.LARGE,
            // gradient: null,
            text: 'withdraw.button'.tr,
            radius: 0,
            onPressed: controller.deposit,
          ),
        ],
      ),
    );
  }

  Widget buildContent() {
    return DefaultTextStyle(
      style: TextStyle(fontSize: 12, color: AppColors.description),
      child: Container(
        constraints: BoxConstraints(maxHeight: Get.height / 1.2),
        padding: EdgeInsets.only(left: 12, right: 12, top: 12),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildHeader(),
              SizedBox(height: 8),
              Text("withdraw.account".tr),
              buildAccountInput(),
              Text("withdraw.amount".tr, style: TextStyle(height: 1)),
              Text(
                "ငွေထုတ်ယူရန် 56.00 MMK လောင်းကြေးလိုအပ်ပါသည်",
                style: TextStyle(fontSize: 10, color: AppColors.primary),
              ),
              buildAmountInput(),
              buildAvaliableAmount(),
              SizedBox(height: 8),
              buildLimitMinimum(),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "WAVEPAY",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: AppColors.title,
          ),
        ),
        CustomerService(),
      ],
    );
  }

  Widget buildAccountInput() {
    return AKBaseInput(
      maxLength: 11,
      placeholder: "withdraw.account.add".tr,
      onSaved: (value) {},
      validator: (value) {
        return null;
      },
    );
  }

  Widget buildAmountInput() {
    return AKBaseInput(
      controller: controller.withdrawAmountCtrl,
      maxLength: 11,
      placeholder: "withdraw.amount.placeholder".tr,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      prefix: const Text(
        "MMK  ",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      suffix: GestureDetector(
        onTap: controller.withdrawAll,
        child: Text("app.all".tr, style: TextStyle(color: AppColors.primary)),
      ),
      onSaved: (value) {},
      validator: (value) {
        return null;
      },
    );
  }

  Widget buildAvaliableAmount() {
    return Amount(
      spacing: 4,
      style: TextStyle(fontSize: 12, color: AppColors.title),
      amountstyle: TextStyle(color: AppColors.primary),
      before: "withdraw.amount.able".tr,
      amount: ' 3000',
    );
  }

  Widget buildLimitMinimum() {
    return Amount(
      spacing: 4,
      style: TextStyle(fontSize: 12, color: AppColors.description),
      amountstyle: TextStyle(color: AppColors.primary),
      before: "withdraw.amount.min".tr,
      amount: ' 3000',
    );
  }
}
