import 'package:app/routes/app_pages.dart';
import 'package:app/services/index.dart';
import 'package:app/theme/index.dart';
import 'package:app/widgets/back_button/back_button.dart';
import 'package:app/widgets/tile/tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final bindStyle = TextStyle(backgroundColor: AppColors.primary);
  final user = UserService.to.userInfo.value!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: AKBackButton(), title: Text("page.account".tr)),
      body: SafeArea(
        child: ListView(
          children: [
            CupertinoListSection.insetGrouped(
              additionalDividerMargin: 0,
              margin: EdgeInsets.only(left: 12, right: 12),
              children: [
                AKTile(titleText: 'account.password'.tr, trailing: buildTail(true), to: Routes.pwd),
                AKTile(titleText: 'account.mobile'.tr, trailing: Obx(() => buildTail(user.mobile != null && user.mobile!.isNotEmpty)), to: Routes.mobile),
                AKTile(titleText: 'account.email'.tr, trailing: buildTail(false), to: Routes.email),
              ],
            ),
          ],
        ),
      ),
    );
  }

  buildTail(bool bound) {
    return Container(
      alignment: Alignment(0, 0),
      height: 16,
      decoration: BoxDecoration(color: bound ? Colors.green : AppColors.warn, borderRadius: BorderRadius.circular(4)),
      padding: EdgeInsets.symmetric(horizontal: 4),
      child: Text(bound ? 'settled' : 'unsettled', style: TextStyle(fontSize: 10, color: Colors.white)),
    );
  }
}
