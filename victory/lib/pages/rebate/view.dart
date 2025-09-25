import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'package:victory/components/amount/amount.dart';
import 'package:victory/components/back_button/back_button.dart';
import 'package:victory/components/button/button.dart';
import 'package:victory/components/multiple_text/multiple_text.dart';
import 'package:victory/extensions/currency.extension.dart';
import 'package:victory/iconfont/iconfont.dart';
import 'package:victory/theme/theme.dart';
import 'package:victory/pages/customer_service/customer_service.dart';
import 'package:victory/pages/rebate/index.dart';

class VicRebatePage extends GetView<RebateController> {
  const VicRebatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RebateController>(
      init: RebateController(),
      id: "rebate",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            leading: const VicBackButton(),
            title: Text("rebate.title".tr),
            actions: [const VicCustomerService()],
            actionsPadding: const EdgeInsets.only(right: 12),
          ),
          body: SafeArea(
            child: ListView(
              padding: const EdgeInsets.all(12),
              children: [
                ListTile(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  minTileHeight: 100,
                  leading: const Icon(IconFont.chouma, color: Color.fromRGBO(255, 130, 64, 1)),
                  title: Padding(padding: const EdgeInsets.symmetric(vertical: 4.0), child: Text("rebate.amount".tr)),
                  titleTextStyle: const TextStyle(fontSize: 16, color: AppColors.title),
                  subtitle: Obx(
                    () => VicAmount(
                      amount: controller.amount.amount(),
                      spacing: 8,
                      style: const TextStyle(fontSize: 24, color: AppColors.primary, fontWeight: FontWeight.bold),
                    ),
                  ),
                  trailing: Obx(
                    () => VicButton(height: 48, disabled: controller.amount == 0, onPressed: controller.cliam, child: Text("app.claim.now".tr)),
                  ),
                ),

                const Padding(
                  padding: EdgeInsetsGeometry.only(top: 16, bottom: 8),
                  child: Text('Rules', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                ),

                DecoratedBox(
                  decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(8)),
                  child: DefaultTextStyle(
                    style: const TextStyle(fontSize: 14, color: AppColors.title),
                    child: Obx(() {
                      return Skeletonizer(
                        enabled: controller.loading.value,
                        child: ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.config.length + 1,
                          separatorBuilder: (context, index) => const Divider(height: 0, color: AppColors.border),
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
                                      child: VicInlineText(
                                        text: "VIP",
                                        style: const TextStyle(color: AppColors.ff9d00, fontWeight: FontWeight.bold),
                                        spaing: 2,
                                        subText: item.name,
                                        subStyle: const TextStyle(fontStyle: FontStyle.italic),
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
        style: const TextStyle(fontSize: 12, color: AppColors.description),
        child: SizedBox(
          height: 36,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(child: Center(child: Text('rebate.level'.tr))),
              Expanded(child: Center(child: Text('app.slots'.tr))),
              Expanded(child: Center(child: Text('app.fishing'.tr))),
              Expanded(child: Center(child: Text('app.poker'.tr))),
            ],
          ),
        ),
      ),
    );
  }
}
