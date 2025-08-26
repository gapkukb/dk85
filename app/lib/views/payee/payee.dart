import 'package:app/helper/copy.dart';
import 'package:app/iconfont/index.dart';
import 'package:app/shared/clipboard/clipboard.dart';
import 'package:app/shared/customer_service/customer_service.dart';
import 'package:app/theme/index.dart';
import 'package:app/widgets/back_button/back_button.dart';
import 'package:app/widgets/button/index.dart';
import 'package:app/widgets/network_picture.dart';
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
        child: AKButton(
          onPressed: submit,
          text: 'payment.receiver.submit'.tr,
          radius: 0,
        ),
      ),
    );
  }

  Widget buildView() {
    const margin = EdgeInsets.all(12);
    return ListTileTheme(
      data: ListTileThemeData(
        minTileHeight: 48,
        titleTextStyle: TextStyle(color: AppColors.description),
        leadingAndTrailingTextStyle: TextStyle(
          color: AppColors.title,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
      child: ListView(
        children: [
          buildPayee(context),
          buildPayor(context),
          buildPayGuide(context),
        ],
      ),
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
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.title,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: AppColors.ffeee5,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              'payment.receiver.target'.tr,
              style: TextStyle(color: AppColors.primary, fontSize: 12),
            ),
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
              NetworkPicture(
                width: 28,
                height: 28,
                imageUrl:
                    "https://imgcdn.knryywqf.com/upload/images/202501/34989806-89dd-4b1f-9609-ee0e7541614e.jpg",
                fit: BoxFit.cover,
              ),
              Text("KBZ Pay"),
            ],
          ),
        ),
        ListTile(
          title: Text('payment.receiver.method'.tr),
          trailing: Row(
            spacing: 4,
            mainAxisSize: MainAxisSize.min,
            children: [Text("0908123451321"), Icon(IconFont.copy, size: 16)],
          ),
          onTap: copier('content'),
        ),
        ListTile(
          title: Text('payment.receiver.amount'.tr),
          trailing: RichText(
            text: TextSpan(
              style: TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
              text: '20000.00',
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
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.title,
            ),
          ),
          Text(
            "(${'app.required'.tr})",
            style: TextStyle(color: AppColors.primary),
          ),
        ],
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: TextField(
            maxLength: 6,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: InputDecoration(
              counterText: '',
              hint: Text(
                'payment.receiver.placeholder'.tr,
                style: TextStyle(fontSize: 12, color: AppColors.description),
              ),
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
          child: NetworkPicture(imageUrl: '', height: 1000),
        ),
      ],
    );
  }

  submit() {}
}
