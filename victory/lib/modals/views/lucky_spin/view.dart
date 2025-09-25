import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:victory/modals/views/modal_template.dart';

import 'index.dart';

class VicModalLuckySpin extends GetView<LuckySpinController> {
  const VicModalLuckySpin({super.key});

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("LuckySpinPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LuckySpinController>(
      init: LuckySpinController(),
      id: "lucky_spin",
      builder: (_) {
        return VicModalTemplate(
          child: Container(
            width: 200,
            height: 200,
            color: Colors.amber,
          ),
        );
      },
    );
  }
}
