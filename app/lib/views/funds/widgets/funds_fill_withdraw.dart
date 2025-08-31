import 'package:app/apis/index.dart';
import 'package:app/extensions/bot_toast.dart';
import 'package:app/hooks/useForm.dart';
import 'package:app/iconfont/index.dart';
import 'package:app/models/withdrawal.model.dart';
import 'package:app/routes/app_pages.dart';
import 'package:app/services/index.dart';
import 'package:app/shared/amount/amount.dart';
import 'package:app/shared/customer_service/customer_service.dart';
import 'package:app/theme/index.dart';
import 'package:app/views/funds/funds_controller.dart';
import 'package:app/widgets/button/index.dart';
import 'package:app/widgets/input_base/input_base.dart';
import 'package:app/widgets/network_picture.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class FundsFillWithdraw extends GetView<FundsController> {
  late final Useform form;
  final WithdrawlModel channel;
  FundsFillWithdraw(this.channel, {super.key}) {
    form = Useform((values) async {
      try {
        BotToast.showLoading();
        await withdrawApi(data: {...values, 'withdraw_id': channel.id});
        BotToast.closeAllLoading();
        await showSuccess(text: '提款申请成功');
        Get.back();
      } catch (e) {
        BotToast.closeAllLoading();
      }
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
            AKButton(
              height: AKButton.LARGE,
              // gradient: null,
              text: 'withdraw.button'.tr,
              radius: 0,
              onPressed: form.submit,
            ),
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
            children: [
              buildHeader(),
              SizedBox(height: 8),
              Text("withdraw.account".tr),
              buildAccountInput(),
              SizedBox(height: 8),
              Text("withdraw.amount".tr, style: TextStyle(height: 1)),
              // Text("ငွေထုတ်ယူရန် 56.00 MMK လောင်းကြေးလိုအပ်ပါသည်", style: TextStyle(fontSize: 10, color: AppColors.primary)),
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
      placeholder: "withdraw.account.add".tr,
      onSaved: form.saveAs('card_no'),
      validator: (value) {
        if (value == null || value.isEmpty) return 'app.required'.tr;
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
      prefix: const Text("MMK  ", style: TextStyle(fontWeight: FontWeight.bold)),
      suffix: GestureDetector(
        onTap: controller.withdrawAll,
        child: Text("app.all".tr, style: TextStyle(color: AppColors.primary)),
      ),
      onSaved: form.saveAs('money'),
      validator: (value) {
        if (value == null || value.isEmpty) return 'app.required'.tr;
        final amount = num.tryParse(value) ?? 0;
        final max = num.tryParse(channel.eachMax) ?? double.infinity;
        final min = num.tryParse(channel.eachMin) ?? double.negativeInfinity;
        if (amount < min) return '最小提现金额:$min';
        if (amount > UserService.to.balance.value) return '您的余额不足';
        if (amount > max) return '最大提现金额:$max';
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
      amount: ' ${UserService.to.balance}',
    );
  }

  Widget buildLimitMinimum() {
    return Amount(
      spacing: 4,
      style: TextStyle(fontSize: 12, color: AppColors.description),
      amountstyle: TextStyle(color: AppColors.primary),
      before: "withdraw.amount.min".tr,
      amount: ' ${num.parse(channel.eachMin)}',
    );
  }
}
