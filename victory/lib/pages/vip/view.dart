import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../components/back_button/back_button.dart';
import '../../components/button/button.dart';
import '../../iconfont/iconfont.dart';
import '../../routes/app_pages.dart';
import '../../theme/theme.dart';
import 'widgets/vip_level.dart';
import 'widgets/widgets.dart';
import 'index.dart';

class VicVipPage extends GetView<VicVipController> {
  const VicVipPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VicVipController>(
      init: VicVipController(),
      id: "vip",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            leading: const VicBackButton(),
            title: const Text("VIP"),
            actions: [
              TextButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.vipDetail);
                },
                child: Text('vip.details'.tr),
              ),
            ],
          ),
          body: SafeArea(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              children: [
                const VicVipCardWidget(),
                const SizedBox(height: 8),
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      VicButton(
                        height: VicButtonHeight.mini,
                        backgroundColor: AppColors.ff8240,
                        rounded: true,
                        minWidth: 60,
                        padding: 8,
                        disabled: controller.page.value == 0,
                        onPressed: controller.carousel.previousPage,
                        text: 'vip.prev.level'.tr,
                        fontSize: 12,
                        iconData: IconFont.arrow_left_trangle,
                      ),
                      Text('vip.level.rights'.trParams({'level': (controller.page.value + 1).toString()})),
                      VicButton(
                        height: VicButtonHeight.mini,
                        backgroundColor: AppColors.primary,
                        rounded: true,
                        padding: 8,
                        minWidth: 60,
                        fontSize: 12,
                        disabled: controller.page.value == controller.grades.length - 1,
                        onPressed: controller.carousel.nextPage,
                        text: 'vip.next.level'.tr,
                        iconRightData: IconFont.arrow_right_trangle,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Obx(() {
                  return CarouselSlider.builder(
                    carouselController: controller.carousel,
                    itemCount: controller.grades.length,
                    itemBuilder: (context, index, realIndex) {
                      final grade = controller.grades[realIndex];
                      return VicVipLevelWidget(grade);
                    },
                    options: CarouselOptions(
                      height: 360,
                      initialPage: controller.page.value,
                      viewportFraction: 1.0,
                      enableInfiniteScroll: false,
                      onPageChanged: controller.onCarouselPageChanged,
                    ),
                  );
                }),
              ],
            ),
          ),
        );
      },
    );
  }
}
