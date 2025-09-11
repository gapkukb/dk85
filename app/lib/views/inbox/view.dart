import 'package:app/models/inbox.model.dart';
import 'package:app/widgets/back_button/back_button.dart';
import 'package:app/widgets/state_block/state_block.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'index.dart';
import 'widgets/widgets.dart';

class InboxView extends GetView<InboxController> {
  const InboxView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InboxController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(leading: AKBackButton(), title: Text("inbox.title".tr)),
          body: SafeArea(
            child: Obx(() {
              final view = buildView();

              if (controller.loading.value) return Skeletonizer(child: view);
              if (controller.messages.isEmpty) return StateBlock();
              return SmartRefresher(
                enablePullUp: true,
                enablePullDown: true,
                onRefresh: controller.onRefresh,
                onLoading: controller.onLoading,
                controller: controller.refresher,
                child: view,
              );
            }),
          ),
        );
      },
    );
  }

  Widget buildView() {
    final data = controller.loading.value ? mock() : controller.messages;

    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 12),
      itemCount: data.length,
      itemBuilder: (context, index) {
        return MessageWidget(data[index]);
      },
      separatorBuilder: (context, index) => SizedBox(height: 8),
    );
  }

  List<InboxModel> mock() {
    return List.filled(8, InboxModel.fromJson({"title": BoneMock.words(4), "content": BoneMock.words(14), "created_at": BoneMock.words(3)}));
  }
}
