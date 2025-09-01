import 'package:app/apis/apis.dart';
import 'package:app/extensions/bot_toast.dart';
import 'package:app/iconfont/index.dart';
import 'package:app/modal_views/daily_check_in/widgets/card.dart';
import 'package:app/modal_views/daily_check_in/widgets/rules.dart';
import 'package:app/services/index.dart';
import 'package:app/theme/index.dart';
import 'package:app/widgets/button/index.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'index.dart';

class DailyCheckInView extends GetView<DailyCheckInController> {
  const DailyCheckInView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DailyCheckInController>(
      init: DailyCheckInController(),
      id: "daily_check_in",
      builder: (_) {
        return Dialog(
          clipBehavior: Clip.antiAlias,
          insetPadding: EdgeInsets.symmetric(horizontal: 24),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
            color: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Text('Check-in activity', style: TextStyle(fontWeight: FontWeight.bold)),
                    const Spacer(),
                    IconButton(
                      icon: Icon(IconFont.gantanhao, size: 18, color: AppColors.label),
                      onPressed: showRules,
                    ),
                  ],
                ),
                Obx(
                  () => GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: controller.list.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 7, mainAxisSpacing: 4, crossAxisSpacing: 4, childAspectRatio: 80 / 128),
                    itemBuilder: (context, index) {
                      final item = controller.list[index];
                      return DailyCheckInCard(item);
                    },
                  ),
                ),
                SizedBox(height: 8),
                AKButton(height: 40, onPressed: claim, text: 'Check-in'),
                SizedBox(height: 12),
              ],
            ),
          ),
        );
      },
    );
  }

  void showRules() {
    Get.bottomSheet(DailyCheckInRules(), isScrollControlled: true);
  }

  void claim() async {
    await appApi.checkIn();
    UserService.to.queryBalance();
    await showSuccess();
    Get.back();
  }
}
