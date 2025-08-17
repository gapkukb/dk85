import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';
import '../../theme/index.dart';
import '../../ui/tile/index.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("账户设置"), centerTitle: true),
      body: SafeArea(
        child: ListView(
          children: [
            AkTileGroup(
              children: [
                AkTile(
                  showArrow: true,
                  titleText: "登录密码",
                  trailingText: buildValue("3123213123123"),
                  onTap: () {
                    Get.toNamed(Routes.updatePasswrod);
                  },
                ),
                const AkTile(titleText: "手机号码"),
                const AkTile(titleText: "邮箱"),
                AkTile(titleText: "真实姓名", trailingText: buildValue("AK47")),
              ],
            ),
          ],
        ),
      ),
    );
  }

  buildValue([String? value]) {
    final hasValue = value != null && value.isNotEmpty;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      decoration: BoxDecoration(color: hasValue ? Colors.green : Colors.amber, borderRadius: BorderRadius.circular(2)),
      child: Text(hasValue ? value : "Not Yet", style: AppText.mini.copyWith(color: Colors.white)),
    );
  }
}
