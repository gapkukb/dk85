import 'package:app/views/vip/widgets/vip_level_tile.dart';
import 'package:app/views/vip/widgets/widgets.dart';
import 'package:app/widgets/back_button/back_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'index.dart';

class VipDetailView extends GetView<VipController> {
  const VipDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VipController>(
      init: VipController(),
      id: "vip",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(leading: AKBackButton(), title: Text('vip.details'.tr)),
          body: SafeArea(
            child: ListView.separated(
              itemCount: controller.grades.length + 1,
              padding: EdgeInsets.symmetric(horizontal: 12),
              separatorBuilder: (context, index) => SizedBox(height: 16),
              itemBuilder: (context, index) {
                if (index == 0) return VipCardWidget();
                final grade = controller.grades[index - 1];
                return VipLevelTileWidget(grade);
              },
            ),
          ),
        );
      },
    );
  }
}
