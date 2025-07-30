import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';
import '../../theme/index.dart';
import 'index.dart';
import 'widgets/widgets.dart';

class MePage extends GetView<MeController> {
  const MePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MeController>(
      builder: (_) {
        return SafeArea(
          child: Scaffold(
            body: ListView(
              children: const [
                _Tile("账户设置", pageName: Routes.DASHBOARD + Routes.PROMOS),
                _Tile("会员权益", pageName: Routes.CASINO),
                _Tile("我收藏的游戏", pageName: Routes.FAVORITES),
                _Tile("邀请好友", pageName: Routes.CASINO),
                _Tile("客户服务", pageName: Routes.CASINO),
                _Tile("消息中心", pageName: Routes.CASINO),
                _Tile("更多设置", pageName: Routes.MORE),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _Tile extends StatelessWidget {
  final String title;
  final String? pageName;
  final VoidCallback? onTap;
  const _Tile(this.title, {super.key, this.onTap, this.pageName});

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile(
      title: Text(title, style: AppText.medium),
      trailing: const CupertinoListTileChevron(),
      onTap: () {
        if (onTap == null) {
          Get.toNamed(pageName!);
        } else {
          onTap!();
        }
      },
    );
  }
}
