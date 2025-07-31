import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/routes/app_pages.dart';
import '/ui/tile/index.dart';
import 'index.dart';

class MePage extends GetView<MeController> {
  const MePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MeController>(
      builder: (_) {
        return SafeArea(
          child: Scaffold(
            body: ListView(
              children: [
                AkTileGroup(
                  children: const [
                    AkTile(isLink: true, titleText: "账户设置", to: Routes.DASHBOARD + Routes.PROMOS),
                    AkTile(isLink: true, titleText: "会员权益", to: Routes.CASINO),
                    AkTile(isLink: true, titleText: "我收藏的游戏", to: Routes.FAVORITES),
                    AkTile(isLink: true, titleText: "邀请好友", to: Routes.CASINO),
                    AkTile(isLink: true, titleText: "客户服务", to: Routes.CASINO),
                    AkTile(isLink: true, titleText: "消息中心", to: Routes.CASINO),
                    AkTile(isLink: true, titleText: "更多设置", to: Routes.MORE),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
