import 'package:app/theme/index.dart';
import 'package:app/views/vip/widgets/vip_bouns.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../index.dart';

class VipLevelWidget extends GetView<VipController> {
  const VipLevelWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 344,
      child: GridView(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          mainAxisExtent: 168,
        ),
        children: [
          VipBounsWidget(),
          VipBounsWidget(),
          VipBounsWidget(),
          VipBounsWidget(),
        ],
      ),
    );
  }
}
