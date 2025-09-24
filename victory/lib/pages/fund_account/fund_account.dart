import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/back_button/back_button.dart';
import '../../iconfont/iconfont.dart';
import '../../theme/theme.dart';

class VicFundAccountPage extends StatelessWidget {
  const VicFundAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: const VicBackButton(), title: Text("funds.withdraw.title".tr)),
      body: SafeArea(
        child: ListView(
          children: [
            CupertinoListSection.insetGrouped(
              margin: const EdgeInsets.symmetric(horizontal: 12),
              hasLeading: false,
              header: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("funds.withdraw.add".tr, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.normal))],
              ),
              children: [],
            ),
            const SizedBox(height: 8),
            CupertinoListSection.insetGrouped(
              margin: const EdgeInsets.symmetric(horizontal: 12),
              hasLeading: false,
              header: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("funds.withdraw.list".tr, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.normal)),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(IconFont.refresh, size: 16, color: AppColors.primary),
                  ),
                ],
              ),
              children: [],
            ),
          ],
        ),
      ),
    );
  }
}
