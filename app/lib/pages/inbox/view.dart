import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../iconfont/index.dart';
import '../../theme/index.dart';
import '../../ui/button/index.dart';
import 'index.dart';
import 'widgets/widgets.dart';

class InboxView extends GetView<InboxController> {
  const InboxView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InboxController>(
      builder: (_) {
        return DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(80),
              child: AppBar(
                title: const Text("消息中心"),
                centerTitle: true,
                shape: LinearBorder.none,
                // centerTitle: true,
                bottom: TabBar(
                  indicatorSize: TabBarIndicatorSize.label,
                  tabAlignment: TabAlignment.fill,
                  labelColor: AppColors.title,
                  indicatorColor: AppColors.primary,
                  labelPadding: const EdgeInsets.all(0),

                  tabs: [buildTab(IconFont.lingdang, "通知"), buildTab(IconFont.zhanneixinguanli, "消息")],
                ),
              ),
            ),
            body: const TabBarView(children: [PrivacyWidget(), SystemWidget()]),
          ),
        );
      },
    );
  }

  buildTab(IconData icon, String name) {
    return Tab(
      height: 32,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 4,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 16),
          Badge(alignment: const Alignment(1.2, -1.2), child: Text(name)),
        ],
      ),
    );
  }
}
