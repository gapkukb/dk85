import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:victory/services/services.dart';
import 'package:victory/theme/theme.dart';
import 'package:victory/pages/vip/index.dart';
import 'package:victory/pages/vip/widgets/requirement.dart';

/// hello
class VicVipCardWidget extends GetView<VicVipController> {
  const VicVipCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 325 / 2,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: const BoxDecoration(
        image: DecorationImage(fit: BoxFit.fill, image: AssetImage("assets/images/vip-card.webp")),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 4),
          Text(services.user.info.value.shortName, style: const TextStyle(fontSize: 12)),
          const SizedBox(height: 20),
          buildLevel(),
          const SizedBox(height: 8),
          Row(
            spacing: 8,
            children: [
              Obx(
                () => Flexible(
                  child: VicRequirementWidget(name: 'vip.need.bet'.tr, precent: controller.betProgress, limit: controller.betLimit),
                ),
              ),
              Obx(
                () => Flexible(
                  child: VicRequirementWidget(name: 'vip.need.charge'.tr, precent: controller.chargeProgress, limit: controller.paymentLimit),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildLevel() {
    LinearGradient gradient = const LinearGradient(
      colors: [Color(0xff945447), AppColors.primary],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    );
    return Padding(
      padding: const EdgeInsets.only(left: 72.0, top: 22),
      child: ShaderMask(
        shaderCallback: (Rect bounds) {
          return gradient.createShader(bounds);
        },
        child: Text(
          "${services.user.info.value.gradeId}",
          style: const TextStyle(fontSize: 48, fontWeight: FontWeight.w900, fontStyle: FontStyle.italic, color: Colors.white, height: 1),
        ),
      ),
    );
  }
}
