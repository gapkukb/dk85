import 'package:app/helper/copy.dart';
import 'package:app/iconfont/index.dart';
import 'package:app/models/fund_record.model.dart';
import 'package:app/routes/app_pages.dart';
import 'package:app/shared/customer_service/customer_service.dart';
import 'package:app/theme/index.dart';
import 'package:app/widgets/back_button/back_button.dart';
import 'package:app/widgets/button/index.dart';
import 'package:app/widgets/multiple_text/multiple_text.dart';
import 'package:app/widgets/tile/tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryDetailView extends StatefulWidget {
  const HistoryDetailView({super.key});

  @override
  _HistoryDetailViewState createState() => _HistoryDetailViewState();
}

class _HistoryDetailViewState extends State<HistoryDetailView> {
  final record = FundRecord.fromRawJson(Get.parameters['all'] as String);
  @override
  Widget build(BuildContext context) {
    print('xxx:${Get.parameters['all']}');
    return Scaffold(
      appBar: AppBar(leading: AKBackButton(), actionsPadding: Gutter.right.normal, actions: [CustomerService()]),
      body: ListView(
        padding: Gutter.horizontal.normal,
        children: [
          Icon(IconFont.pending, size: 96, color: AppColors.warn),
          Padding(
            padding: Gutter.vertical.normal,
            child: Text(
              'Pending Payment',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),

          CupertinoListSection.insetGrouped(
            hasLeading: false,
            margin: EdgeInsets.all(0),
            separatorColor: AppColors.background,
            additionalDividerMargin: 0,
            children: [
              AKTile(
                titleText: 'Order Number',
                additionalInfo: Text(record.tradeNo, style: TextStyle(fontWeight: FontWeight.bold)),
                isLink: false,
                trailing: Icon(IconFont.copy, color: AppColors.label, size: 16),
                onTap: copier(record.tradeNo),
              ),
              AKTile(
                isLink: false,
                titleText: 'Order Amount',
                trailing: Text(
                  '${record.money}',
                  style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.danger),
                ),
              ),
              AKTile(isLink: false, titleText: 'Recharge Method', trailing: Text(record.channel)),
              AKTile(isLink: false, titleText: 'Recharge time', trailing: Text(record.time)),
            ],
          ),

          Align(
            alignment: Alignment(1, 0),
            child: TextButton(
              onPressed: CustomerService.call,
              child: MutipleText(fontSize: 12, spaing: 4, color: AppColors.title, subColor: AppColors.primary, text: 'Any question?', subText: 'contact us!'),
            ),
          ),
        ],
      ),

      /// 充值成功不显示此按钮，其他情况显示
      bottomNavigationBar: SafeArea(
        maintainBottomViewPadding: true,
        child: AKButton(
          onPressed: () {
            Get.toNamed(Routes.payee);
          },
          radius: 0,
          text: 'Pay',
        ),
      ),
    );
  }
}
