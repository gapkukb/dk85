import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:victory/apis/apis.dart';
import 'package:victory/components/amount/amount.dart';
import 'package:victory/components/button/button.dart';
import 'package:victory/components/input_base/input_base.dart';
import 'package:victory/hooks/useForm.dart';
import 'package:victory/models/models.dart';
import 'package:victory/shared/dialogs/dialog.dart';
import 'package:victory/services/services.dart';
import 'package:victory/theme/colors.dart';
import 'package:victory/pages/customer_service/customer_service.dart';
import 'package:victory/pages/funds/controller.dart';

class VicWithdrawalFilling extends GetView<FundsController> {
  final VicWithdrawalChannelModel channel;
  late final Useform form;
  VicWithdrawalFilling(this.channel, {super.key}) {
    form = Useform((values) async {
      await apis.fund.withdraw(data: {...values, 'withdraw_id': channel.id});
      await VicDialog.success();
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
            VicButton(text: 'app.withdraw'.tr, height: VicButtonHeight.medium, borderRadius: 0, onPressed: form.submit),
          ],
        ),
      ),
    );
  }

  Widget buildContent() {
    return DefaultTextStyle(
      style: const TextStyle(fontSize: 12, color: AppColors.description),
      child: Container(
        constraints: BoxConstraints(maxHeight: Get.height / 1.2),
        padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 8,
            children: [
              buildHeader(),
              Text("funds.withdraw.acc".tr),
              buildAccountInput(),
              Text("funds.withdraw.amount".tr, style: const TextStyle(height: 1)),
              // Text("ငွေထုတ်ယူရန် 56.00 MMK လောင်းကြေးလိုအပ်ပါသည်", style: TextStyle(fontSize: 10, color: AppColors.primary)),
              buildAmountInput(),
              buildAvaliableAmount(),
              buildLimitMinimum(),
              const SizedBox(height: 24),
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
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.title),
        ),
        const VicCustomerService(),
      ],
    );
  }

  Widget buildAccountInput() {
    return VicBaseInput(
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
    return VicBaseInput(
      controller: controller.withdrawAmountCtrl,
      maxLength: 11,
      placeholder: "form.withdraw.amount".tr,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      prefix: const Text("MMK  ", style: TextStyle(fontWeight: FontWeight.bold)),
      suffix: GestureDetector(
        onTap: controller.withdrawAll,
        child: Text("app.all".tr, style: const TextStyle(color: AppColors.primary)),
      ),
      onSaved: form.saveAs('money'),
      validator: (value) {
        if (value == null || value.isEmpty) return 'form.required'.tr;
        final amount = num.tryParse(value) ?? 0;
        final max = channel.eachMax;
        final min = channel.eachMin;
        if (amount < min) return 'form.min.error'.trParams({'min': min.toString()});
        if (amount > services.user.balance.value) return 'funds.insft'.tr;
        if (amount > max) return 'form.max.error'.trParams({'max': max.toString()});
        return null;
      },
    );
  }

  Widget buildAvaliableAmount() {
    return VicAmount(
      spacing: 4,
      style: const TextStyle(fontSize: 14, color: AppColors.title),
      amountstyle: const TextStyle(color: AppColors.primary),
      before: "funds.withdraw.balance".tr,
      amount: ' ${services.user.balance.value}',
    );
  }

  Widget buildLimitMinimum() {
    return VicAmount(
      spacing: 4,
      style: const TextStyle(fontSize: 14, color: AppColors.description),
      amountstyle: const TextStyle(color: AppColors.primary),
      before: "funds.withdraw.limit".tr,
      amount: ' ${channel.eachMin}',
    );
  }
}
