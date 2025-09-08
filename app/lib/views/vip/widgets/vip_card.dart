import 'package:app/services/index.dart';
import 'package:app/theme/index.dart';
import 'package:app/views/vip/widgets/requirement.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../index.dart';

/// hello
class VipCardWidget extends GetView<VipController> {
  const VipCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 325 / 2,
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        image: DecorationImage(fit: BoxFit.fill, image: AssetImage("assets/images/vip-card.webp")),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 4),
          Text("${services.user.userInfo.value?.shortName}", style: TextStyle(fontSize: 12)),
          SizedBox(height: 20),
          buildLevel(),
          SizedBox(height: 8),
          Row(
            spacing: 8,
            children: [
              Obx(
                () => Flexible(
                  child: RequirementWidget(name: 'vip.need.bet'.tr, precent: controller.betProgress, limit: controller.myLevel.betLimit),
                ),
              ),
              Obx(
                () => Flexible(
                  child: RequirementWidget(name: 'vip.need.charge'.tr, precent: controller.chargeProgress, limit: controller.myLevel.paymentLimit),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildLevel() {
    LinearGradient gradient = LinearGradient(colors: [Color(0xff945447), AppColors.primary], begin: Alignment.centerLeft, end: Alignment.centerRight);
    return Padding(
      padding: const EdgeInsets.only(left: 72.0),
      child: ShaderMask(
        shaderCallback: (Rect bounds) {
          return gradient.createShader(bounds);
        },
        child: Text(
          "${services.user.userInfo.value?.gradeId}",
          style: TextStyle(fontSize: 72, fontWeight: FontWeight.w900, fontStyle: FontStyle.italic, color: Colors.white, height: 1),
        ),
      ),
    );
  }
}
