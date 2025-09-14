import 'package:app/apis/apis.dart';
import 'package:app/extensions/bot_toast.dart';
import 'package:app/iconfont/index.dart';
import 'package:app/views_modal/base_modal/base_modal.dart';
import 'package:app/views_modal/daily_check_in/widgets/card.dart';
import 'package:app/views_modal/daily_check_in/widgets/rules.dart';
import 'package:app/services/index.dart';
import 'package:app/theme/index.dart';
import 'package:app/widgets/button/index.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'index.dart';

class DailyCheckInModal extends GetView<DailyCheckInController> {
  const DailyCheckInModal({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DailyCheckInController>(
      init: DailyCheckInController(),
      id: "daily_check_in",
      builder: (_) {
        return BaseModal(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Text('dci.title'.tr, style: TextStyle(fontWeight: FontWeight.bold)),
                  const Spacer(),
                  IconButton(
                    icon: Icon(IconFont.gantanhao, size: 18, color: AppColors.label),
                    onPressed: showRules,
                  ),
                ],
              ),
              Obx(() {
                final view = GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.list.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 7, mainAxisSpacing: 4, crossAxisSpacing: 4, childAspectRatio: 80 / 128),
                  itemBuilder: (context, index) {
                    final item = controller.list[index];
                    return DailyCheckInCard(item);
                  },
                );

                if (controller.loading.value) {
                  return Skeletonizer(ignoreContainers: true, child: view);
                }
                return view;
              }),
              SizedBox(height: 8),
              Obx(() => AKButton(height: 40, onPressed: controller.loading.value ? null : claim, text: 'dci.button'.tr)),

              SizedBox(height: 12),
            ],
          ),
        );
      },
    );
  }

  void showRules() {
    Get.bottomSheet(DailyCheckInRules(rules: controller.rules.value), isScrollControlled: true);
  }

  void claim() async {
    await apis.app.checkIn();
    services.user.queryBalance();
    await showSuccess();
    Get.back();
  }
}
