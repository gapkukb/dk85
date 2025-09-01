import 'package:app/apis/apis.dart';
import 'package:app/hooks/useForm.dart';
import 'package:app/iconfont/index.dart';
import 'package:app/models/top_up.model.dart';
import 'package:app/routes/app_pages.dart';
import 'package:app/shared/customer_service/customer_service.dart';
import 'package:app/theme/index.dart';
import 'package:app/views/funds/funds_controller.dart';
import 'package:app/views/funds/widgets/funds_preset_amount.dart';
import 'package:app/widgets/button/index.dart';
import 'package:app/widgets/input_base/input_base.dart';
import 'package:app/widgets/network_picture.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class FundsFillDeposit extends GetView<FundsController> {
  final TopUpModel channel;
  const FundsFillDeposit(this.channel, {super.key});

  @override
  Widget build(BuildContext context) {
    final form = Useform((values) async {
      final order = await fundApi.createTopUpOrder(
        data: {
          // 	string	支付接口ID
          'account_id': channel.id,
          //是	string	金额
          'money': values['amount'],
          // 	string	充值”recharge”、提现”withdrawal”
          'order_type': "recharge",
          // 	string	提现时必填用户银行卡帐号
          // user_card_no: "",
          // 	string	提现时必填用户银行卡姓名
          'user_card_name': "1",
          // 	string	优惠活动ID, 0无活动
          'activity_id': "0",
          // 	string	是否手机端。1= 是；0= 否
          'mobile': "1",
          // 	string	银行代码。可选
          // bank_value: "",
          // 	string	随机数。防止重复提交
          'nonce': Uuid().v1(),
        },
      );

      Get.offAndToNamed(
        Routes.payee,
        parameters: {
          'id': channel.id.toString(),
          'refrence': order.data.orderSn,
          'name': channel.name,
          'logo': channel.logo,
          'amount': values['amount'],
          'image_url': order.data.imageUrl,
          'sysTradeNo': order.data.sysTradeNo,
        },
      );
    });
    return Form(
      key: form.key,
      child: Material(
        color: AppColors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildContent(form),
            SafeArea(
              child: AKButton(
                height: AKButton.LARGE,
                // gradient: null,
                text: 'app.deposit'.tr,
                radius: 0,
                onPressed: form.submit,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildContent(Useform form) {
    return Container(
      constraints: BoxConstraints(maxHeight: Get.height / 1.2),
      padding: EdgeInsets.only(left: 12, right: 12, top: 12),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("payment.receiver.title".tr, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                CustomerService(),
              ],
            ),
            Text("payment.method".tr, style: TextStyle(fontSize: 12, color: AppColors.description)),

            buildChannel(),

            SizedBox(height: 8),

            Text("payment.amount".tr, style: TextStyle(fontSize: 12, color: AppColors.description)),

            // if (channel.isInput == 1) FundsPresetAmount(),
            FundsPresetAmount(channel.moneyList),

            SizedBox(height: 8),

            AKBaseInput(
              controller: controller.ctrl,
              maxLength: 11,
              placeholder: "payment.limit".tr,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              suffix: const Text("MMK", style: TextStyle(height: 1)),
              onSaved: form.saveAs('amount'),
              validator: (value) {
                if (value == null || value.isEmpty) return 'app.required'.tr;
                final amount = num.tryParse(value) ?? 0;
                final max = num.tryParse(channel.eachMax) ?? double.infinity;
                final min = num.tryParse(channel.eachMin) ?? double.negativeInfinity;
                if (amount < min) return '最小充值金额:$min';
                if (amount > max) return '最大充值金额:$max';
                return null;
              },
            ),

            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  Widget buildTitle(String title, String? text) {
    final ret = Text(
      title,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
    );

    if (text == null || text.isEmpty) return ret;
    return Row(spacing: 4, crossAxisAlignment: CrossAxisAlignment.center, children: [ret, buildDescription(text)]);
  }

  Widget buildDescription(String text) {
    return ColoredBox(
      color: AppColors.ff8240,
      child: Text(" $text ", style: TextStyle(fontSize: 8, color: AppColors.white)),
    );
  }

  Widget buildChannel() {
    return Stack(
      children: [
        ListTile(
          tileColor: AppColors.ffeee5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(8),
            side: BorderSide(color: AppColors.primary),
          ),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            clipBehavior: Clip.hardEdge,
            child: NetworkPicture(width: 36, height: 36, imageUrl: channel.logo, fit: BoxFit.cover),
          ),
          title: buildTitle(channel.name, channel.remark),
        ),
        Positioned(right: 8, top: 8, child: Icon(IconFont.selected, color: AppColors.primary)),
      ],
    );
  }
}
