import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:victory/components/back_button/back_button.dart';
import 'package:victory/components/tile/tile.dart';
import 'package:victory/models/models.dart';
import 'package:victory/routes/app_pages.dart';
import 'package:victory/services/services.dart';
import 'package:victory/theme/theme.dart';

class VicAccountPage extends StatefulWidget {
  const VicAccountPage({super.key});

  @override
  State<VicAccountPage> createState() => _VicAccountPageState();
}

class _VicAccountPageState extends State<VicAccountPage> {
  VicUserModel get user => services.user.info.value;
  final bindStyle = const TextStyle(backgroundColor: AppColors.primary);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: const VicBackButton(), title: Text("acc.title".tr)),
      body: SafeArea(
        child: Column(
          children: [
            Obx(() {
              return CupertinoListSection.insetGrouped(
                additionalDividerMargin: 0,
                margin: AppSizes.pad_a_12,
                separatorColor: AppColors.border,
                children: [
                  VicTile(titleText: 'acc.password'.tr, trailing: buildTail(user.hasPass == 1), to: AppRoutes.pwd),
                  VicTile(titleText: 'acc.mobile'.tr, trailing: buildTail(user.mobile.isNotEmpty), to: AppRoutes.mobile),
                  VicTile(titleText: 'acc.email'.tr, trailing: buildTail(user.email.isNotEmpty), to: AppRoutes.email),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }

  buildTail(bool bound) {
    return Container(
      alignment: const Alignment(0, 0),
      height: 16,
      decoration: BoxDecoration(color: bound ? Colors.green : AppColors.warn, borderRadius: BorderRadius.circular(4)),
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Text(bound ? 'Settled' : 'Not yet', style: const TextStyle(fontSize: 10, color: Colors.white)),
    );
  }
}
