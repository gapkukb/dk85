import 'package:app/helper/copy.dart';
import 'package:app/iconfont/index.dart';
import 'package:app/models/fund_record.model.dart';
import 'package:app/routes/app_pages.dart';
import 'package:app/shared/customer_service/customer_service.dart';
import 'package:app/shared/fund_state.dart';
import 'package:app/theme/index.dart';
import 'package:app/widgets/back_button/back_button.dart';
import 'package:app/widgets/button/index.dart';
import 'package:app/widgets/multiple_text/multiple_text.dart';
import 'package:app/widgets/tile/tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryDetailView extends StatelessWidget {
  // 详情页类型：1-充值，2-提现
  final int type;
  const HistoryDetailView(this.type, {super.key});

  @override
  Widget build(BuildContext context) {
    final order = Get.arguments as FundRecord;
    final state = FundState(type, order.status);
    final typeText = type == 1 ? 'Recharge' : 'Withdraw';

    return Scaffold(
      appBar: AppBar(leading: AKBackButton(), actionsPadding: Gutter.right.normal, actions: [CustomerService()]),
      body: ListView(
        padding: Gutter.horizontal.normal,
        children: [
          Icon(state.icon, size: 96, color: state.color),
          Padding(
            padding: Gutter.vertical.normal,
            child: Text(
              state.text,
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
                additionalInfo: Text(order.tradeNo, style: TextStyle(fontWeight: FontWeight.bold)),
                isLink: false,
                trailing: Icon(IconFont.copy, color: AppColors.label, size: 16),
                onTap: copier(order.tradeNo),
              ),
              AKTile(
                isLink: false,
                titleText: 'Order Amount',
                trailing: Text(
                  '${order.money}',
                  style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.danger),
                ),
              ),
              AKTile(isLink: false, titleText: '$typeText Method', trailing: Text(order.channel)),
              AKTile(isLink: false, titleText: '$typeText time', trailing: Text(order.time)),
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
      bottomNavigationBar: type == 1 && order.status == 1
          ? SafeArea(
              maintainBottomViewPadding: true,
              child: AKButton(
                onPressed: () {
                  Get.toNamed(Routes.payee);
                },
                radius: 0,
                text: 'Pay',
              ),
            )
          : null,
    );
  }
}
