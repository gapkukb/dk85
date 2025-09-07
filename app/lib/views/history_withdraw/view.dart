import 'package:app/shared/chooser/index.dart';
import 'package:app/widgets/state_block/state_block.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'index.dart';

class HistoryWithdrawView extends GetView<WithdrawHisotryLogic> {
  const HistoryWithdrawView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WithdrawHisotryLogic>(
      init: WithdrawHisotryLogic(),
      id: "history_withdraw",
      builder: (_) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(32),
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Chooser(
                  initValue: controller.date.value,
                  options: ChooserOptions(items: controller.dateOptions, prefixText: 'Date:'),
                  onChanged: (value, current) {
                    controller.date.value = value;
                    controller.reset();
                  },
                ),
              ),
            ),
          ),
          body: SafeArea(
            child: Obx(() {
              final initialLoading = controller.initialLoading.value;
              if (controller.list.isEmpty) return StateBlock();
              final listWidget = ListView.separated(
                itemCount: controller.list.length,
                padding: EdgeInsets.only(left: 12, right: 12, bottom: 12),
                separatorBuilder: (context, index) => SizedBox(height: 8),
                itemBuilder: (context, index) {
                  final item = controller.list[index];
                  return HistoryWithdrawTile(item);
                },
              );
              if (initialLoading) {
                return Skeletonizer(enabled: controller.initialLoading.value, child: listWidget);
              }

              return SmartRefresher(enablePullUp: true, controller: controller.refresher, onLoading: controller.onLoading, onRefresh: controller.onRefresh, child: listWidget);
            }),
          ),
        );
      },
    );
  }
}
