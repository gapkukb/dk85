import 'package:app/apis/apis.dart';
import 'package:app/extensions/bot_toast.dart';
import 'package:app/helper/copy.dart';
import 'package:app/iconfont/index.dart';
import 'package:app/models/top_up_order.model.dart';
import 'package:app/shared/amount/amount.dart';
import 'package:app/shared/customer_service/customer_service.dart';
import 'package:app/theme/index.dart';
import 'package:app/widgets/back_button/back_button.dart';
import 'package:app/widgets/button/index.dart';
import 'package:app/widgets/network_picture.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class PayeeView extends StatefulWidget {
  const PayeeView({super.key});

  @override
  State<PayeeView> createState() => _PayeeViewState();
}

class _PayeeViewState extends State<PayeeView> {
  final controller = TextEditingController();
  final order = Get.arguments as TopUpOrderModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        leading: AKBackButton(),
        title: Text("payee.title".tr),
        actionsPadding: EdgeInsets.only(right: 12),
        actions: [CustomerService(size: 36, iconSize: 22)],
      ),
      body: buildView(),
      bottomNavigationBar: SafeArea(
        child: AKButton(onPressed: submit, text: 'app.submit'.tr, radius: 0),
      ),
    );
  }

  Widget buildView() {
    return ListTileTheme(
      data: ListTileThemeData(
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
      margin: Gutter.horizontal.normal,
      hasLeading: false,
      dividerMargin: 0,
      header: Row(
        spacing: 8,
        children: [
          Text(
            'payee.acc'.tr,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: AppColors.title),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(color: AppColors.ffeee5, borderRadius: BorderRadius.circular(10)),
            child: Text('payee.extra'.tr, style: TextStyle(color: AppColors.primary, fontSize: 12)),
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
              NetworkPicture(width: 28, height: 28, imageUrl: '', fit: BoxFit.cover),
              Text(order.channelName),
            ],
          ),
        ),
        ListTile(
          title: Text('payee.acc'.tr),
          trailing: Row(spacing: 4, mainAxisSize: MainAxisSize.min, children: [Text(order.channelCardNo), Icon(IconFont.copy, size: 16)]),
          onTap: copier(order.sysTradeNo),
        ),
        ListTile(
          title: Text('funds.topup.amount'.tr),
          trailing: Amount(
            amount: '${order.amount}',
            spacing: 4,
            style: TextStyle(color: AppColors.title),
            amountstyle: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold, fontSize: 14),
          ),
        ),
      ],
    );
  }

  Widget buildPayor(BuildContext context) {
    return CupertinoListSection.insetGrouped(
      margin: Gutter.horizontal.normal,
      hasLeading: false,
      header: Row(
        spacing: 8,
        children: [
          Text(
            'payee.transId'.tr,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: AppColors.title),
          ),
          Text("(${'app.required'.tr})", style: TextStyle(color: AppColors.primary, fontSize: 12)),
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
              hint: Text('form.payee.placed'.tr, style: TextStyle(fontSize: 12, color: AppColors.description)),
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
        style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.title),
      ),
      children: [
        Padding(
          padding: EdgeInsets.all(12),
          child: NetworkPicture(imageUrl: order.imageUrl, height: 1000),
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
    await apis.funds.matchTopup(data: {'sys_trade_no': order.sysTradeNo, 'bank_serial': value, 'account_id': order.channelId});
    await showSuccess();
    Get.back();
    Get.back();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
