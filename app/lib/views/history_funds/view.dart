import 'package:app/shared/chooser/index.dart';
import 'package:app/theme/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'index.dart';

class HistoryFundsView extends StatefulWidget {
  const HistoryFundsView({super.key});

  @override
  State<HistoryFundsView> createState() => _HistoryFundsViewState();
}

class _HistoryFundsViewState extends State<HistoryFundsView>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const _HistoryFundsViewGetX();
  }
}

class _HistoryFundsViewGetX extends GetView<HistoryFundsController> {
  const _HistoryFundsViewGetX({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HistoryFundsController>(
      init: HistoryFundsController(),
      id: "history_funds",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 32,
            title: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Chooser<int>(
                    initValue: controller.date.value,
                    onChanged: (value, current) {
                      controller.date.value = value;
                      controller.load();
                    },
                    options: ChooserOptions(
                      items: controller.dateOptions,
                      prefixText: 'Date:',
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: SafeArea(
            child: SmartRefresher(
              controller: controller.refresher,
              onRefresh: controller.onRefresh,
              onLoading: controller.onLoading,
              enablePullUp: true,
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 12),
                itemCount: 10,
                separatorBuilder: (context, index) => SizedBox(height: 8),
                itemBuilder: (context, index) {
                  return _Tile();
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

class _Tile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final amount = '+997,800.00';

    return ListTile(
      titleAlignment: ListTileTitleAlignment.bottom,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      titleTextStyle: TextStyle(fontSize: 12, color: AppColors.label),
      subtitleTextStyle: TextStyle(fontSize: 14, color: AppColors.title),
      leadingAndTrailingTextStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: amount.startsWith('-') ? AppColors.danger : AppColors.success,
      ),
      title: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 16.0),
        child: Text('2025-08-21 00:00:00'),
      ),
      subtitle: Text('Platform Funds Switch'),
      trailing: Text(amount),
    );
  }
}
