import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../theme/index.dart';
import '/ui/tile/index.dart';
import '/shared/package_info/index.dart';
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
      appBar: AppBar(
        leading: const BackButton(
          // color: Colors.amber,
          style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.white)),
        ),
      ),
      body: ListView(
        children: [
          AkTileGroup(
            inset: true,
            children: [
              AkTile(titleText: "app.language".tr, trailing: Obx(() => Text(I18n.getLocaleName(storage.locale.value))), showArrow: true, onTap: showLocalePicker),
              AkTile(titleText: "app.version".tr, trailingText: "V${packageInfo.version}", onTap: () {}),
              AkTile(
                titleText: "app.bgm".tr,
                trailing: SizedBox(
                  child: Obx(() => CupertinoSwitch(value: appService.audioManager.enable, onChanged: appService.audioManager.toggle)),
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Button.large(text: "app.logout".tr, color: Button.danger, filled: true, radius: 0, elevation: 1, onPressed: logout),
    );
  }

  logout() {
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
            // textStyle: TextStyle(color: Theme.of(context).primaryColor),
            onPressed: () {
              Get.back();
            },
            child: const Text("Confirm"),
          ),
        ],
      ),
    );
  }
}
