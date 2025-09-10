import 'package:app/extensions/num.dart';
import 'package:app/iconfont/index.dart';
import 'package:app/services/index.dart';
import 'package:app/shared/amount/amount.dart';
import 'package:app/shared/customer_service/customer_service.dart';
import 'package:app/theme/index.dart';
import 'package:app/widgets/back_button/back_button.dart';
import 'package:app/widgets/button/index.dart';
import 'package:app/widgets/multiple_text/multiple_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'index.dart';

class RebateView extends GetView<RebateController> {
  const RebateView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RebateController>(
      init: RebateController(),
      id: "rebate",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(leading: AKBackButton(), title: const Text("rebate"), actions: [CustomerService()], actionsPadding: EdgeInsets.only(right: 12)),
          body: SafeArea(
            child: ListView(
              padding: EdgeInsets.all(12),
              children: [
                ListTile(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  minTileHeight: 100,
                  leading: Icon(IconFont.chouma, color: const Color.fromRGBO(255, 130, 64, 1)),
                  title: Padding(padding: const EdgeInsets.symmetric(vertical: 4.0), child: Text("Wagering Volume")),
                  titleTextStyle: TextStyle(fontSize: 16, color: AppColors.title),
                  subtitle: Obx(
                    () => Amount(
                      amount: controller.amount.display(),
                      spacing: 8,
                      style: TextStyle(fontSize: 24, color: AppColors.primary, fontWeight: FontWeight.bold),
                    ),
                  ),
                  trailing: AKButton(height: 48, onPressed: controller.amount == 0 ? null : controller.cliam, child: Text("app.claim.now".tr)),
                ),

                Padding(
                  padding: EdgeInsetsGeometry.only(top: 16, bottom: 8),
                  child: Text('Rules', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                ),

                DecoratedBox(
                  decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(8)),
                  child: DefaultTextStyle(
                    style: TextStyle(fontSize: 14, color: AppColors.title),
                    child: Obx(() {
                      return Skeletonizer(
                        enabled: controller.loading.value,
                        child: ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: controller.config.length + 1,
                          separatorBuilder: (context, index) => Divider(height: 0, color: AppColors.border),
                          itemBuilder: (context, index) {
                            if (index == 0) return buildRuleHeader();
                            final item = controller.config[index - 1];
                            return SizedBox(
                              height: 48,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Center(
                                      child: MutipleText(
                                        text: "VIP",
                                        style: TextStyle(color: AppColors.ff9d00, fontWeight: FontWeight.bold),
                                        spaing: 2,
                                        subText: item.name,
                                        subStyle: TextStyle(fontStyle: FontStyle.italic),
                                      ),
                                    ),
                                  ),
                                  Expanded(child: Center(child: Text('${item.rebatePercentEgame}%'))),
                                  Expanded(child: Center(child: Text('${item.rebatePercentEgame}%'))),
                                  Expanded(child: Center(child: Text('${item.rebatePercentEgame}%'))),
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildRuleHeader() {
    return Skeleton.keep(
      child: DefaultTextStyle(
        style: TextStyle(fontSize: 12, color: AppColors.description),
        child: SizedBox(
          height: 36,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(child: Center(child: Text('VIP Level'))),
              Expanded(child: Center(child: Text('Slots'))),
              Expanded(child: Center(child: Text('Fishing'))),
              Expanded(child: Center(child: Text('Poker'))),
            ],
          ),
        ),
      ),
    );
  }
}
