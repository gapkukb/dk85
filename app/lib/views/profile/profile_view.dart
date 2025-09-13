import 'package:app/models/user_info.model.dart';
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
  UserModel get user => services.user.userInfo.value!;
  final bindStyle = TextStyle(backgroundColor: AppColors.primary);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: AKBackButton(), title: Text("acc.title".tr)),
      body: SafeArea(
        child: Column(
          children: [
            Obx(() {
              return CupertinoListSection.insetGrouped(
                additionalDividerMargin: 0,
                margin: Gutter.all.normal,
                children: [
                  AKTile(titleText: 'acc.password'.tr, trailing: buildTail(user.hasPass == 1), to: Routes.pwd),
                  AKTile(titleText: 'acc.mobile'.tr, trailing: buildTail(user.mobile.isNotEmpty), to: Routes.mobile),
                  AKTile(titleText: 'acc.email'.tr, trailing: buildTail(user.email.isNotEmpty), to: Routes.email),
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
      alignment: Alignment(0, 0),
      height: 16,
      decoration: BoxDecoration(color: bound ? Colors.green : AppColors.warn, borderRadius: BorderRadius.circular(4)),
      padding: EdgeInsets.symmetric(horizontal: 4),
      child: Text(bound ? 'Settled' : 'Not yet', style: TextStyle(fontSize: 10, color: Colors.white)),
    );
  }
}
