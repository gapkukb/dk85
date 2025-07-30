import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

import '../../helper/package_info.dart';
import '../../services/index.dart';
import '../../theme/index.dart';

class MoreView extends StatelessWidget {
  const MoreView({super.key});

  @override
  Widget build(BuildContext context) {
    final appService = Get.find<AppService>();

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 48,
        title: const Text("更多设置"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          CupertinoListSection(
            additionalDividerMargin: 16,
            dividerMargin: 0,
            topMargin: 16,
            children: [
              const _Tile(title: "语言"),
              const _Tile(title: "当前版本"),
              _Tile(
                title: "背景音乐",
                trailing: SizedBox(
                  height: 12,
                  child: Transform.scale(
                    alignment: Alignment.centerRight,
                    scale: 0.8,
                    child: CupertinoSwitch(value: true, onChanged: (value) {}),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: MaterialButton(
        height: 48,
        textColor: Colors.white,
        color: AppColors.danger,
        onPressed: () {
          Get.dialog(
            CupertinoAlertDialog(
              title: const Text("确认退出"),
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

          // Get.defaultDialog(
          //   title: "确认退出登录吗？",
          //   textCancel: "取消",
          //   textConfirm: "确定",
          // );
        },
        child: const Text("退出登录", style: AppText.large),
      ),
    );
  }
}

class _Tile extends StatelessWidget {
  final String title;
  final Widget? additionalInfo;
  final Widget trailing;

  const _Tile({
    super.key,
    required this.title,
    this.additionalInfo,
    this.trailing = const CupertinoListTileChevron(),
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile(
      padding: const EdgeInsets.only(left: 16, top: 10, bottom: 10, right: 8),
      title: Text(title, style: const TextStyle(fontSize: 16)),
      additionalInfo: additionalInfo,
      trailing: trailing,
    );
  }
}
