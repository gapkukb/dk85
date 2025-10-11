import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:victory/apis/apis.dart';
import 'package:victory/components/amount/amount.dart';
import 'package:victory/components/back_button/back_button.dart';
import 'package:victory/components/button/button.dart';
import 'package:victory/components/clipboard/clipboard.dart';
import 'package:victory/components/network_image/network_image.dart';
import 'package:victory/iconfont/iconfont.dart';
import 'package:victory/models/models.dart';
import 'package:victory/shared/dialogs/dialog.dart';
import 'package:victory/theme/theme.dart';
import 'package:victory/pages/customer_service/customer_service.dart';

class VicPayeePage extends StatefulWidget {
  const VicPayeePage({super.key});

  @override
  State<VicPayeePage> createState() => _VicPayeePageState();
}

class _VicPayeePageState extends State<VicPayeePage> {
  final controller = TextEditingController();
  final order = Get.arguments as VicPaymentOrderModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        leading: const VicBackButton(),
        title: Text("payee.title".tr),
        actionsPadding: const EdgeInsets.only(right: 12),
        actions: [const VicCustomerService(size: 36, iconSize: 22)],
      ),
      body: buildView(),
      bottomNavigationBar: SafeArea(
        child: VicButton(
          onPressed: submit,
          text: 'app.submit'.tr,
          borderRadius: 0,
          height: VicButtonHeight.medium,
        ),
      ),
    );
  }

  Widget buildView() {
    return ListTileTheme(
      data: const ListTileThemeData(
        minTileHeight: 48,
        contentPadding: EdgeInsets.symmetric(horizontal: 12),
        titleTextStyle: TextStyle(color: AppColors.description, fontSize: 12),
        leadingAndTrailingTextStyle: TextStyle(color: AppColors.title, fontSize: 12, fontWeight: FontWeight.bold),
      ),
      child: ListView(children: [buildPayee(context), buildPayor(context), buildPayGuide(context)]),
    );
  }

  Widget buildPayee(BuildContext context) {
    return CupertinoListSection.insetGrouped(
      margin: AppSizes.pad_x_12,
      hasLeading: false,
      dividerMargin: 0,
      header: Row(
        spacing: 8,
        children: [
          Text(
            'payee.acc'.tr,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: AppColors.title),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(color: AppColors.ffeee5, borderRadius: BorderRadius.circular(10)),
            child: Text('payee.extra'.tr, style: const TextStyle(color: AppColors.primary, fontSize: 12)),
          ),
        ],
      ),
      children: [
        ListTile(
          title: Text('funds.topup.method'.tr),
          trailing: Row(
            spacing: 4,
            mainAxisSize: MainAxisSize.min,
            children: [
              VicNetworkImage(width: 28, height: 28, imageUrl: order.logo ?? '', fit: BoxFit.cover),
              Text(order.channelName),
            ],
          ),
        ),
        ListTile(
          title: Text('payee.acc'.tr),
          trailing: Row(spacing: 4, mainAxisSize: MainAxisSize.min, children: [Text(order.channelCardNo), const Icon(IconFont.copy, size: 16)]),
          onTap: () => VicClipboard.copy(order.channelCardNo),
        ),
        ListTile(
          title: Text('funds.topup.amount'.tr),
          trailing: VicAmount(
            amount: '${order.amount}',
            spacing: 4,
            style: const TextStyle(color: AppColors.title),
            amountstyle: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold, fontSize: 14),
          ),
        ),
      ],
    );
  }

  Widget buildPayor(BuildContext context) {
    return CupertinoListSection.insetGrouped(
      margin: AppSizes.pad_x_12,
      hasLeading: false,
      header: Row(
        spacing: 8,
        children: [
          Text(
            'payee.transId'.tr,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: AppColors.title),
          ),
          Text("(${'app.required'.tr})", style: const TextStyle(color: AppColors.primary, fontSize: 12)),
        ],
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: TextField(
            controller: controller,
            maxLength: 6,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: InputDecoration(
              counterText: '',
              hint: Text('form.payee.placed'.tr, style: const TextStyle(fontSize: 12, color: AppColors.description)),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildPayGuide(BuildContext context) {
    return CupertinoListSection(
      hasLeading: false,
      header: Text(
        'payee.guide'.tr,
        style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.title),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: VicNetworkImage(imageUrl: order.imageUrl, height: 1000),
        ),
      ],
    );
  }

  submit() async {
    final value = controller.text;
    if (value.isEmpty || value.length != 6) {
      BotToast.showText(text: 'form.payee.placed'.tr);
      return;
    }
    await apis.fund.matchTopup(data: {'sys_trade_no': order.sysTradeNo, 'bank_serial': value, 'account_id': order.channelId});
    await VicDialog.success();
    Get.back();
    Get.back();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
