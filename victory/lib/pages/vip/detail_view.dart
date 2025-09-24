import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../components/back_button/back_button.dart';
import '../../theme/theme.dart';
import 'index.dart';
import 'widgets/vip_level_tile.dart';
import 'widgets/widgets.dart';

class VicVipDetailsPage extends GetView<VicVipController> {
  const VicVipDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VicVipController>(
      init: VicVipController(),
      id: "vip",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(leading: const VicBackButton(), title: Text('vip.details'.tr)),
          body: SafeArea(
            child: ListView.separated(
              itemCount: controller.grades.length + 1,
              padding: AppSizes.pad_not_t_12,
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                if (index == 0) return const VicVipCardWidget();
                final grade = controller.grades[index - 1];
                return VicVipLevelTileWidget(grade);
              },
            ),
          ),
        );
      },
    );
  }
}
