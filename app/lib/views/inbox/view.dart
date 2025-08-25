import 'package:app/widgets/back_button/back_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'index.dart';
import 'widgets/widgets.dart';

class InboxView extends GetView<InboxController> {
  const InboxView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InboxController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(leading: AKBackButton(), title: Text("page.inbox".tr)),
          body: SafeArea(
            child: Obx(
              () => controller.messages.isNotEmpty ? buildView() : buildEmpty(),
            ),
          ),
        );
      },
    );
  }

  Widget buildView() {
    return SmartRefresher(
      enablePullUp: true,
      enablePullDown: true,
      onRefresh: controller.onRefresh,
      onLoading: controller.onLoading,
      controller: controller.refresher,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 12),
        itemCount: controller.messages.length,
        itemBuilder: (context, index) {
          return MessageWidget();
        },
        separatorBuilder: (context, index) => SizedBox(height: 8),
      ),
    );
  }

  Widget buildEmpty() {
    return SmartRefresher(
      enablePullUp: true,
      onRefresh: controller.onRefresh,
      onLoading: controller.onLoading,
      controller: controller.refresher,
      child: ListView(children: [Text('empty')]),
    );
  }
}
