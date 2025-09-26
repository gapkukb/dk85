import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'package:victory/apis/apis.dart';
import 'package:victory/components/button/button.dart';
import 'package:victory/iconfont/iconfont.dart';
import 'package:victory/shared/dialogs/dialog.dart';
import 'package:victory/services/services.dart';
import 'package:victory/theme/theme.dart';
import 'package:victory/modals/views/modal_template.dart';
import 'package:victory/modals/views/daily_check_in/index.dart';
import 'package:victory/modals/views/daily_check_in/widgets/card.dart';
import 'package:victory/modals/views/daily_check_in/widgets/rules.dart';

class VicModalDailyCheckIn extends GetView<DailyCheckInController> {
  const VicModalDailyCheckIn({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DailyCheckInController>(
      init: DailyCheckInController(),
      id: "daily_check_in",
      builder: (_) {
        return VicModalTemplate(
          alignment: const Alignment(0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Text('dci.title'.tr, style: const TextStyle(fontWeight: FontWeight.bold)),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(IconFont.gantanhao, size: 18, color: AppColors.label),
                    onPressed: showRules,
                  ),
                ],
              ),
              Obx(() {
                final view = GridView.builder(
                  padding: AppSizes.zero,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.list.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 7,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                    childAspectRatio: 80 / 128,
                  ),
                  itemBuilder: (context, index) {
                    final item = controller.list[index];
                    return VicDailyCheckInItem(item);
                  },
                );

                if (controller.loading.value) {
                  return Skeletonizer(ignoreContainers: true, child: view);
                }
                return view;
              }),
              const SizedBox(height: 8),
              Obx(() => VicButton(height: 40, onPressed: controller.loading.value ? null : claim, text: 'dci.button'.tr)),
              const SizedBox(height: 12),
            ],
          ),
        );
      },
    );
  }

  void showRules() {
    Get.bottomSheet(VicDailyCheckInRules(rules: controller.rules.value), isScrollControlled: true);
  }

  void claim() async {
    await apis.app.checkIn();
    services.user.updateBalance();
    await VicDialog.success();
    Get.back();
  }
}
