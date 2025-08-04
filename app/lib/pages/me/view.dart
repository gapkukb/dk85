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
        return Scaffold(
          body: ListView(
            children: [
              AkTileGroup(
                children: const [
                  AkTile(isLink: true, title: "账户设置", to: Routes.SETTINGS),
                  AkTile(isLink: true, title: "会员权益", to: Routes.CASINO),
                  AkTile(isLink: true, title: "我收藏的游戏", to: Routes.FAVORITES),
                  AkTile(isLink: true, title: "邀请好友", to: Routes.CASINO),
                  AkTile(isLink: true, title: "客户服务", to: Routes.CUSTOMER_SERVICE),
                  AkTile(isLink: true, title: "消息中心", to: Routes.INBOX),
                  AkTile(isLink: true, title: "更多设置", to: Routes.MORE),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
