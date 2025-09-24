import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../components/action_sheet/action_sheet.dart';
import '../../components/action_sheet/action_sheet_builder.dart';
import '../../components/state_block/state_block.dart';
import 'index.dart';

class VicWithdrawalHistory extends GetView<WithdrawHisotryLogic> {
  const VicWithdrawalHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WithdrawHisotryLogic>(
      init: WithdrawHisotryLogic(),
      id: "history_withdraw",
      builder: (_) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(32),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Obx(
                  () => HistoryActionSheet(
                    title: "Date:${controller.dateLabel}",
                    initValue: controller.date.value,
                    actions: controller.dateActions,
                    onChanged: (value) {
                      controller.date.value = value;
                      controller.reset();
                    },
                  ),
                ),
              ),
            ),
          ),
          body: SafeArea(
            child: Obx(() {
              final initialLoading = controller.initialLoading.value;
              if (controller.list.isEmpty) return const VicStateBlock();
              final listWidget = ListView.separated(
                itemCount: controller.list.length,
                padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
                separatorBuilder: (context, index) => const SizedBox(height: 8),
                itemBuilder: (context, index) {
                  final item = controller.list[index];
                  return HistoryWithdrawTile(item);
                },
              );
              if (initialLoading) {
                return Skeletonizer(enabled: controller.initialLoading.value, child: listWidget);
              }

              return SmartRefresher(
                enablePullUp: true,
                controller: controller.refresher,
                onLoading: controller.onLoading,
                onRefresh: controller.onRefresh,
                child: listWidget,
              );
            }),
          ),
        );
      },
    );
  }
}
