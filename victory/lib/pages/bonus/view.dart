import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:victory/components/network_image/network_image.dart';
import 'package:victory/iconfont/iconfont.dart';
import 'package:victory/routes/app_pages.dart';
import 'package:victory/shared/user_meta/user_meta.dart';
import 'package:victory/theme/theme.dart';
import 'package:victory/pages/customer_service/customer_service.dart';
import 'package:victory/pages/bonus/index.dart';

class VicBonusPage extends StatefulWidget {
  const VicBonusPage({super.key});

  @override
  State<VicBonusPage> createState() => _VicBonusPageState();
}

class _VicBonusPageState extends State<VicBonusPage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const _BonusViewGetX();
  }
}

class _BonusViewGetX extends GetView<VicBonusController> {
  const _BonusViewGetX({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VicBonusController>(
      init: VicBonusController(),
      id: "bonus",
      builder: (_) {
        return Scaffold(
          appBar: buildAppBar(),
          body: Obx(() {
            return ListView.separated(
              padding: const EdgeInsets.all(12),
              itemCount: controller.data.length,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final promo = controller.data[index];
                return GestureDetector(
                  onTap: promo.url.isEmpty ? null : () => Get.toNamed(AppRoutes.activity, arguments: promo.url),
                  child: PhysicalModel(
                    color: Colors.transparent,
                    clipBehavior: Clip.antiAlias,
                    borderRadius: BorderRadius.circular(8),
                    child: VicNetworkImage(imageUrl: promo.image, height: 264 / 2, fit: BoxFit.cover),
                  ),
                );
              },
            );
          }),
        );
      },
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.background,
      titleSpacing: 12,
      automaticallyImplyLeading: false,
      title: const VicUserMeta(),
      actionsPadding: const EdgeInsets.only(right: 12),
      actions: [
        GestureDetector(
          onTap: () {
            // Dialogs.to.dailyCheckIn();
            // Dialogs.to.show(DialogNames.dailyCheckIn);
          },

          child: Container(
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(36)),
            width: 36,
            height: 36,
            child: const Icon(IconFont.qiandao, color: AppColors.highlight),
          ),
        ),
        const SizedBox(width: 4),
        const VicCustomerService(),
      ],
    );
  }
}
