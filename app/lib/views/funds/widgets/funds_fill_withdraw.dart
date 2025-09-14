import 'package:app/apis/apis.dart';
import 'package:app/extensions/bot_toast.dart';
import 'package:app/hooks/useForm.dart';
import 'package:app/models/withdrawal.model.dart';
import 'package:app/services/index.dart';
import 'package:app/shared/amount/amount.dart';
import 'package:app/shared/customer_service/customer_service.dart';
import 'package:app/theme/index.dart';
import 'package:app/views/funds/funds_controller.dart';
import 'package:app/widgets/button/index.dart';
import 'package:app/widgets/input_base/input_base.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class FundsFillWithdraw extends GetView<FundsController> {
  late final Useform form;
  final WithdrawlModel channel;
  FundsFillWithdraw(this.channel, {super.key}) {
    form = Useform((values) async {
      await apis.funds.withdraw(data: {...values, 'withdraw_id': channel.id});
      await showSuccess();
      Get.back();
      services.user.queryBalance();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: form.key,
      child: Material(
        color: AppColors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildContent(),
            AKButton(text: 'app.withdraw'.tr, radius: 0, onPressed: form.submit),
          ],
        ),
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
            spacing: 8,
            children: [
              buildHeader(),
              Text("funds.withdraw.acc".tr),
              buildAccountInput(),
              Text("funds.withdraw.amount".tr, style: TextStyle(height: 1)),
              // Text("ငွေထုတ်ယူရန် 56.00 MMK လောင်းကြေးလိုအပ်ပါသည်", style: TextStyle(fontSize: 10, color: AppColors.primary)),
              buildAmountInput(),
              buildAvaliableAmount(),
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
          channel.name,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.title),
        ),
        CustomerService(),
      ],
    );
  }

  Widget buildAccountInput() {
    return AKBaseInput(
      maxLength: 11,
      placeholder: "form.withdraw.acc".tr,
      onSaved: form.saveAs('card_no'),
      validator: (value) {
        if (value == null || value.isEmpty) return 'form.required'.tr;
        return null;
      },
    );
  }

  Widget buildAmountInput() {
    return AKBaseInput(
      controller: controller.withdrawAmountCtrl,
      maxLength: 11,
      placeholder: "form.withdraw.amount".tr,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      prefix: const Text("MMK  ", style: TextStyle(fontWeight: FontWeight.bold)),
      suffix: GestureDetector(
        onTap: controller.withdrawAll,
        child: Text("app.all".tr, style: TextStyle(color: AppColors.primary)),
      ),
      onSaved: form.saveAs('money'),
      validator: (value) {
        if (value == null || value.isEmpty) return 'form.required'.tr;
        final amount = num.tryParse(value) ?? 0;
        final max = channel.eachMax;
        final min = channel.eachMin;
        if (amount < min) return 'form.min.error'.trParams({'min': min.toString()});
        if (amount > services.user.balance.value) return '您的余额不足';
        if (amount > max) return 'form.max.error'.trParams({'max': max.toString()});
        return null;
      },
    );
  }

  Widget buildAvaliableAmount() {
    return Amount(
      spacing: 4,
      style: TextStyle(fontSize: 14, color: AppColors.title),
      amountstyle: TextStyle(color: AppColors.primary),
      before: "funds.withdraw.balance".tr,
      amount: ' ${services.user.balance}',
    );
  }

  Widget buildLimitMinimum() {
    return Amount(
      spacing: 4,
      style: TextStyle(fontSize: 14, color: AppColors.description),
      amountstyle: TextStyle(color: AppColors.primary),
      before: "funds.withdraw.limit".tr,
      amount: ' ${channel.eachMin}',
    );
  }
}
