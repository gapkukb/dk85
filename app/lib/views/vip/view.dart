import 'dart:math';

import 'package:app/iconfont/index.dart';
import 'package:app/routes/app_pages.dart';
import 'package:app/theme/index.dart';
import 'package:app/views/vip/widgets/vip_level.dart';
import 'package:app/widgets/back_button/back_button.dart';
import 'package:app/widgets/button/index.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widgets/widgets.dart';
import 'index.dart';

class VipView extends GetView<VipController> {
  const VipView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VipController>(
      init: VipController(),
      id: "vip",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            leading: AKBackButton(),
            title: Text("VIP"),
            actions: [
              TextButton(
                onPressed: () {
                  Get.toNamed(Routes.vipDetail);
                },
                child: Text('page.detail'.tr),
              ),
            ],
          ),
          body: SafeArea(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 12),
              children: [
                VipCardWidget(),
                SizedBox(height: 8),
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AKButton(
                        height: AKButton.MINI,
                        color: AppColors.ff8240,
                        rounded: true,
                        minWidth: 60,
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        onPressed: controller.page.value == 0 ? null : controller.carousel.previousPage,
                        text: 'vip.prev.level'.tr,
                        icon: IconFont.arrow_left_trangle,
                      ),
                      Text('vip.level.rights'.trParams({'level': (controller.page.value + 1).toString()})),
                      AKButton(
                        height: AKButton.MINI,
                        color: AppColors.primary,
                        rounded: true,
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        minWidth: 60,
                        onPressed: controller.page.value == 12 ? null : controller.carousel.nextPage,
                        text: 'vip.next.level'.tr,
                        rightIcon: IconFont.arrow_right_trangle,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(8)),
                  padding: EdgeInsets.all(8),
                  child: Obx(() {
                    return CarouselSlider.builder(
                      carouselController: controller.carousel,
                      itemCount: controller.grades.length,
                      itemBuilder: (context, index, realIndex) {
                        final grade = controller.grades[realIndex];
                        return VipLevelWidget(grade);
                      },
                      options: CarouselOptions(
                        height: 344,
                        initialPage: controller.page.value,
                        viewportFraction: 1.0,
                        enableInfiniteScroll: false,
                        onPageChanged: controller.onCarouselPageChanged,
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
