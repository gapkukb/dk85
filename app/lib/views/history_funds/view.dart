import 'package:app/shared/chooser/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Chooser<int>(
                  initValue: controller.date.value,
                  onChanged: (value, current) {
                    controller.date.value = value;
                  },
                  options: ChooserOptions(
                    title: 'ssssssssss',
                    items: controller.dateOptions,
                    prefixText: 'Date:',
                  ),
                ),
                Obx(() => Text(controller.date.value.toString())),
                Chooser<String>(
                  initValue: 'aaa',
                  options: ChooserOptions(
                    options: [
                      {'title': 'aaa', 'value': 'aaa'},
                      {'title': 'bbb', 'value': 'bbb'},
                    ],
                    prefixText: 'Date:',
                  ),
                ),
              ],
            ),
          ),
          body: SafeArea(
            child: ListView(
              children: [
                Obx(() => Text(controller.start)),
                Text(controller.end),
              ],
            ),
          ),
        );
      },
    );
  }
}
