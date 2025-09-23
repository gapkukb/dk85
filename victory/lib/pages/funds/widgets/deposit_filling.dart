import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../../../apis/apis.dart';
import '../../../components/button/button.dart';
import '../../../components/input_base/input_base.dart';
import '../../../components/network_image/network_image.dart';
import '../../../hooks/useForm.dart';
import '../../../iconfont/iconfont.dart';
import '../../../models/models.dart';
import '../../../routes/app_pages.dart';
import '../../../theme/colors.dart';
import '../../customer_service/customer_service.dart';
import '../controller.dart';
import 'deposit_preset_amount.dart';

class VicDepositFilling extends GetView<FundsController> {
  final VicDepositChannelModel channel;

  VicDepositFilling(this.channel);
  @override
  Widget build(BuildContext context) {
    final form = Useform((values) async {
      final order = await Apis.fund.createDepositOrder(
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
          'nonce': const Uuid().v1(),
        },
      );
      order.logo = channel.logo;
      order.amount = int.tryParse(values['amount']) ?? 0;
      order.channelId = channel.id.toInt();
      Get.offAndToNamed(AppRoutes.payee, arguments: order);
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
              child: VicButton(
                height: VicButtonHeight.medium,
                // gradient: null,
                text: 'app.deposit'.tr,
                borderRadius: 0,
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
      padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("funds.topup.title".tr, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                const VicCustomerService(),
              ],
            ),
            Text("funds.topup.method".tr, style: const TextStyle(fontSize: 12, color: AppColors.description)),

            buildChannel(),

            const SizedBox(height: 8),

            Text("funds.topup.amount".tr, style: const TextStyle(fontSize: 12, color: AppColors.description)),

            // if (channel.isInput == 1) FundsPresetAmount(),
            VicDepositPresets(channel.moneyList),

            const SizedBox(height: 8),

            VicBaseInput(
              controller: controller.ctrl,
              maxLength: 11,
              placeholder: "funds.topup.limit".trParams({'min': channel.eachMin.toString(), 'max': channel.eachMax.toString()}),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              suffix: const Text("MMK", style: TextStyle(height: 1)),
              onSaved: form.saveAs('amount'),
              validator: (value) {
                if (value == null || value.isEmpty) return 'form.required'.tr;
                final amount = num.tryParse(value) ?? 0;
                final max = channel.eachMax;
                final min = channel.eachMin;
                if (amount < min) return 'form.min.error'.trParams({'min': min.toString()});
                if (amount > max) return 'form.max.error'.trParams({'max': max.toString()});
                return null;
              },
            ),

            const SizedBox(height: 8),
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
      child: Text(" $text ", style: const TextStyle(fontSize: 8, color: AppColors.white)),
    );
  }

  Widget buildChannel() {
    return Stack(
      children: [
        ListTile(
          tileColor: AppColors.ffeee5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(8),
            side: const BorderSide(color: AppColors.primary),
          ),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            clipBehavior: Clip.hardEdge,
            child: VicNetworkImage(width: 36, height: 36, imageUrl: channel.logo, fit: BoxFit.cover),
          ),
          title: buildTitle(channel.name, channel.remark),
        ),
        const Positioned(right: 8, top: 8, child: Icon(IconFont.selected, color: AppColors.primary)),
      ],
    );
  }
}
