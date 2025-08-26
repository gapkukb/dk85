import 'package:app/shared/chooser/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'index.dart';

class HistoryTopUpView extends GetView<HistoryTopUpController> {
  const HistoryTopUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HistoryTopUpController>(
      init: HistoryTopUpController(),
      id: "history_top_up",
      builder: (_) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(32),
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Chooser(
                  initValue: controller.date.value,
                  options: ChooserOptions(
                    items: controller.dateOptions,
                    prefixText: 'Date:',
                  ),
                  onChanged: (value, current) {
                    controller.date.value = value;
                  },
                ),
              ),
            ),
          ),
          body: SafeArea(
            child: SmartRefresher(
              controller: controller.refresher,
              onLoading: controller.onLoading,
              onRefresh: controller.onRefresh,
              child: ListView.separated(
                itemCount: 10,
                padding: EdgeInsets.only(left: 12, right: 12, bottom: 12),
                separatorBuilder: (context, index) => SizedBox(height: 8),
                itemBuilder: (context, index) {
                  return HistoryTopUpTile();
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
