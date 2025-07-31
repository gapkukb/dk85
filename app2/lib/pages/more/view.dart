import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../ui/tile/index.dart';
import '/helper/package_info.dart';
import '/i18n/index.dart';
import '/services/index.dart';
import '/storage/index.dart';
import '/widgets/Button.dart';

class MoreView extends StatelessWidget {
  const MoreView({super.key});

  @override
  Widget build(BuildContext context) {
    final appService = Get.find<AppService>();

    return Scaffold(
      appBar: AppBar(leadingWidth: 48, title: Text("language".tr), centerTitle: true),
      body: ListView(
        children: [
          CupertinoListSection(
            additionalDividerMargin: 16,
            dividerMargin: 0,
            topMargin: 16,
            children: [
              AkTile(titleText: "语言", value: Obx(() => Text(I18n.getLocaleName(Storage.locale.value))), isLink: true, onTap: showLocalePicker),
              AkTile(titleText: "当前版本", valueText: "V${packageInfo.version}", onTap: () {}),
              AkTile(
                titleText: "背景音乐",
                value: Transform.scale(
                  alignment: Alignment.centerRight,
                  scale: 0.8,
                  child: Obx(() => CupertinoSwitch(value: appService.audioManager.enable, onChanged: appService.audioManager.toggle)),
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Button.large(
        text: "退出登录",
        color: Button.danger,
        radius: 0,
        onPressed: () {
          Get.dialog(
            CupertinoAlertDialog(
              content: const Text("确认退出"),
              // content: Text("退出后，您将无法进行游戏、领取优惠、参加活动等，是否继续退出？"),
              actions: [
                CupertinoDialogAction(
                  isDestructiveAction: true,
                  isDefaultAction: true,
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text("Cancel"),
                ),
                CupertinoDialogAction(
                  textStyle: TextStyle(color: Theme.of(context).primaryColor),
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text("Confirm"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
