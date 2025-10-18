import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:victory/components/back_button/back_button.dart';
import 'package:victory/components/button/button.dart';
import 'package:victory/components/clipboard/clipboard.dart';
import 'package:victory/components/multiple_text/multiple_text.dart';
import 'package:victory/components/tile/tile.dart';
import 'package:victory/constants/fund_state.dart';
import 'package:victory/iconfont/iconfont.dart';
import 'package:victory/models/fund_record.model.dart';
import 'package:victory/models/models.dart';
import 'package:victory/routes/app_pages.dart';
import 'package:victory/theme/theme.dart';
import 'package:victory/pages/customer_service/customer_service.dart';

class VicFundHistoryDetailPage extends StatelessWidget {
  // 详情页类型：1-充值，2-提现
  final int type;
  const VicFundHistoryDetailPage(this.type, {super.key});

  @override
  Widget build(BuildContext context) {
    final order = Get.arguments as VicFundHisotryModel;
    final state = VicFundState(type, order.status);
    final typeText = type == 1 ? 'Recharge' : 'Withdraw';

    return Scaffold(
      appBar: AppBar(leading: const VicBackButton(), actionsPadding: AppSizes.pad_r_12, actions: [const VicCustomerService()]),
      body: ListView(
        padding: AppSizes.pad_x_12,
        children: [
          Icon(state.icon, size: 96, color: state.color),
          Padding(
            padding: AppSizes.pad_y_12,
            child: Text(
              state.text,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),

          CupertinoListSection.insetGrouped(
            hasLeading: false,
            margin: const EdgeInsets.all(0),
            separatorColor: AppColors.background,
            additionalDividerMargin: 0,
            children: [
              VicTile(
                titleText: 'Order Number',
                additionalInfo: Text(order.tradeNo, style: const TextStyle(fontWeight: FontWeight.bold)),
                isLink: false,
                trailing: const Icon(IconFont.copy, color: AppColors.label, size: 16),
                onTap: () => VicClipboard.copy(order.tradeNo),
              ),
              VicTile(
                isLink: false,
                titleText: 'Order Amount',
                trailing: Text(
                  '${order.money}',
                  style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.danger),
                ),
              ),
              VicTile(isLink: false, titleText: '$typeText Method', trailing: Text(order.channel)),
              VicTile(isLink: false, titleText: '$typeText time', trailing: Text(order.time)),
            ],
          ),

          const Align(
            alignment: Alignment(1, 0),
            child: TextButton(
              onPressed: VicCustomerService.call,
              child: VicInlineText(
                fontSize: 12,
                spaing: 4,
                color: AppColors.title,
                subColor: AppColors.primary,
                text: 'Any question?',
                subText: 'contact us!',
              ),
            ),
          ),
        ],
      ),

      /// 充值成功不显示此按钮，其他情况显示
      bottomNavigationBar: type == 1 && order.status == 1
          ? SafeArea(
              maintainBottomViewPadding: true,
              child: VicButton(
                height: VicButtonHeight.medium,
                onPressed: () {
                  Get.toNamed(
                    AppRoutes.payee,
                    arguments: VicPaymentOrderModel(
                      channelCardNo: order.cardNo,
                      channelName: order.channel,
                      code: 200,
                      orderSn: order.tradeNo,
                      result: 'ok',
                      sysTradeNo: order.sysTradeNo,
                      imageUrl: order.imageUrl,
                    ),
                  );
                },
                borderRadius: 0,
                text: 'Pay',
              ),
            )
          : null,
    );
  }
}
