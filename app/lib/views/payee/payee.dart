import 'package:app/apis/apis.dart';
import 'package:app/extensions/bot_toast.dart';
import 'package:app/helper/copy.dart';
import 'package:app/iconfont/index.dart';
import 'package:app/shared/clipboard/clipboard.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        leading: AKBackButton(),
        title: Text("payment.receiver.title".tr),
        actionsPadding: EdgeInsets.only(right: 12),
        actions: [CustomerService(size: 36, iconSize: 22)],
      ),
      body: buildView(),
      bottomNavigationBar: SafeArea(
        child: AKButton(onPressed: submit, text: 'payment.receiver.submit'.tr, radius: 0),
      ),
    );
  }

  Widget buildView() {
    const margin = EdgeInsets.all(12);
    return ListTileTheme(
      data: ListTileThemeData(
        minTileHeight: 48,
        titleTextStyle: TextStyle(color: AppColors.description),
        leadingAndTrailingTextStyle: TextStyle(color: AppColors.title, fontSize: 14, fontWeight: FontWeight.bold),
      ),
      child: ListView(children: [buildPayee(context), buildPayor(context), buildPayGuide(context)]),
    );
  }

  Widget buildPayee(BuildContext context) {
    return CupertinoListSection(
      hasLeading: false,
      header: Row(
        spacing: 8,
        children: [
          Text(
            'payment.receiver.acc'.tr,
            style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.title),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(color: AppColors.ffeee5, borderRadius: BorderRadius.circular(10)),
            child: Text('payment.receiver.target'.tr, style: TextStyle(color: AppColors.primary, fontSize: 12)),
          ),
        ],
      ),
      children: [
        ListTile(
          title: Text('payment.method'.tr),
          trailing: Row(
            spacing: 4,
            mainAxisSize: MainAxisSize.min,
            children: [
              NetworkPicture(width: 28, height: 28, imageUrl: Get.parameters['logo']!, fit: BoxFit.cover),
              Text("${Get.parameters['name']}"),
            ],
          ),
        ),
        ListTile(
          title: Text('payment.receiver.method'.tr),
          trailing: Row(spacing: 4, mainAxisSize: MainAxisSize.min, children: [Text("${Get.parameters['refrence']}"), Icon(IconFont.copy, size: 16)]),
          onTap: copier(Get.parameters['refrence']!),
        ),
        ListTile(
          title: Text('payment.receiver.amount'.tr),
          trailing: RichText(
            text: TextSpan(
              style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold, fontSize: 14),
              text: '${Get.parameters['amount']}',
              children: [
                TextSpan(
                  text: ' MMK',
                  style: TextStyle(color: AppColors.description),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildPayor(BuildContext context) {
    return CupertinoListSection(
      hasLeading: false,
      header: Row(
        spacing: 8,
        children: [
          Text(
            'payment.receiver.bill.No.'.tr,
            style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.title),
          ),
          Text("(${'app.required'.tr})", style: TextStyle(color: AppColors.primary)),
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
              hint: Text('payment.receiver.placeholder'.tr, style: TextStyle(fontSize: 12, color: AppColors.description)),
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
        'payment.receiver.guide'.tr,
        style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.title),
      ),
      children: [
        Padding(
          padding: EdgeInsets.all(12),
          child: NetworkPicture(imageUrl: Get.parameters['image_url']!, height: 1000),
        ),
      ],
    );
  }

  submit() async {
    final value = controller.text;
    if (value.isEmpty) {
      BotToast.showText(text: '请填写回执号');
      return;
    }
    try {
      BotToast.showLoading();
      await apis.funds.matchTopup(data: {'sys_trade_no': Get.parameters['sysTradeNo'], 'bank_serial': value, 'account_id': Get.parameters['id']});
      BotToast.closeAllLoading();
      await showSuccess(text: '提交成功!');
      Get.back();
    } catch (e) {
      BotToast.closeAllLoading();
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
