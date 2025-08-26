import 'package:app/shared/chooser/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'index.dart';

class HistoryGamesView extends StatefulWidget {
  const HistoryGamesView({super.key});

  @override
  State<HistoryGamesView> createState() => _HistoryGamesViewState();
}

class _HistoryGamesViewState extends State<HistoryGamesView>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const _HistoryGamesViewGetX();
  }
}

class _HistoryGamesViewGetX extends GetView<HistoryGamesController> {
  const _HistoryGamesViewGetX({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HistoryGamesController>(
      init: HistoryGamesController(),
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
                    options: ChooserOptions(
                      items: controller.dateOptions,
                      prefixText: 'Date:',
                    ),
                    onChanged: (value, current) {
                      controller.date.value = value;
                      controller.load();
                    },
                  ),
                  Chooser<String>(
                    initValue: controller.kind.value,
                    options: ChooserOptions(
                      items: controller.kindsOptions,
                      prefixText: 'Game:',
                    ),
                    onChanged: (value, current) {
                      controller.kind.value = value;
                      controller.load();
                    },
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
                  return HistoryGamesTile();
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
