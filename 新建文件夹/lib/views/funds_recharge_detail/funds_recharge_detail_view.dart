import 'package:app/iconfont/index.dart';
import 'package:app/shared/clipboard/clipboard.dart';
import 'package:app/shared/customer_service/customer_service.dart';
import 'package:app/theme/index.dart';
import 'package:app/widgets/back_button/back_button.dart';
import 'package:app/widgets/button/index.dart';
import 'package:app/widgets/network_picture.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FundsRechargeDetailView extends StatefulWidget {
  const FundsRechargeDetailView({super.key});

  @override
  State<FundsRechargeDetailView> createState() =>
      _FundsRechargeDetailViewState();
}

class _FundsRechargeDetailViewState extends State<FundsRechargeDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        leading: AKBackButton(),
        title: Text("payment.receiver.title".tr),
        actionsPadding: EdgeInsets.only(right: 12),
        actions: [CustomerServiceTrigger(size: 36, iconSize: 22)],
      ),
      body: buildView(),
      bottomNavigationBar: AKButton(
        onPressed: submit,
        text: 'payment.receiver.submit'.tr,
        radius: 0,
      ),
    );
  }

  Widget buildView() {
    const margin = EdgeInsets.all(12);
    const style = TextStyle(fontSize: 14, color: AppColors.label);
    return ListView(
      children: [
        CupertinoListSection.insetGrouped(
          margin: margin,
          dividerMargin: 0,
          additionalDividerMargin: 0,
          hasLeading: false,
          children: [
            ListTile(
              title: Text('payment.amount'.tr),
              trailing: Text('Transfer Here'.tr),
              titleTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: AppColors.title,
              ),
              leadingAndTrailingTextStyle: TextStyle(
                fontSize: 14,
                color: AppColors.primary,
              ),
            ),

            ListTile(
              title: Text('payment.method'.tr),
              titleTextStyle: style,
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
                  Text(
                    "KBZ Pay",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.title,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text('payment.receiver.method'.tr),
              titleTextStyle: style,
              trailing: Row(
                spacing: 4,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "0908123451321",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.title,
                    ),
                  ),
                  Icon(IconFont.copy, size: 16),
                ],
              ),
              onTap: () {
                AKClipboard.copy('content');
              },
            ),
            ListTile(
              title: Text('payment.receiver.amount'.tr),
              titleTextStyle: style,
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
        ),
        CupertinoListSection.insetGrouped(
          margin: margin,
          children: [
            ListTile(title: Text('data')),
            ListTile(title: Text('data')),
            ListTile(title: Text('data')),
            ListTile(title: Text('data')),
          ],
        ),
        CupertinoListSection(
          margin: margin,
          children: [
            IntrinsicHeight(child: NetworkPicture(imageUrl: '', height: 1000)),
          ],
        ),
      ],
    );
  }

  submit() {}
}
