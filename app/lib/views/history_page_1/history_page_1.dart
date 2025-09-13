import 'package:app/shared/customer_service/customer_service.dart';
import 'package:app/shared/keep_alive_wrapper/keep_alive_wrapper.dart';
import 'package:app/views/history_funds/view.dart';
import 'package:app/views/history_games/index.dart';
import 'package:app/widgets/back_button/back_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryPage1View extends StatefulWidget {
  const HistoryPage1View({super.key});

  @override
  _HistoryPage1ViewState createState() => _HistoryPage1ViewState();
}

class _HistoryPage1ViewState extends State<HistoryPage1View> with SingleTickerProviderStateMixin {
  late final TabController controller;

  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AKBackButton(),
        title: PreferredSize(
          preferredSize: Size.fromHeight(24),
          child: TabBar(
            indicatorColor: Colors.transparent,
            controller: controller,
            dividerHeight: 0,
            labelPadding: EdgeInsets.all(0),
            tabs: [
              Tab(text: "records.change.title".tr),
              Tab(text: "records.game.title".tr),
            ],
          ),
        ),
        actions: [CustomerService()],
      ),
      body: SafeArea(
        child: TabBarView(
          controller: controller,
          children: [
            HistoryFundsView(),
            KeepAliveWrapper(child: HistoryGamesView()),
          ],
        ),
      ),
    );
  }
}
