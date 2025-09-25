import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:victory/components/back_button/back_button.dart';
import 'package:victory/components/keep_alive_wrapper/keep_alive_wrapper.dart';
import 'package:victory/pages/customer_service/customer_service.dart';
import 'package:victory/pages/history_top_up/index.dart';
import 'package:victory/pages/history_withdraw/index.dart';

class VicHistoryList2Page extends StatefulWidget {
  const VicHistoryList2Page({super.key});

  @override
  _VicHistoryList2PageState createState() => _VicHistoryList2PageState();
}

class _VicHistoryList2PageState extends State<VicHistoryList2Page> with SingleTickerProviderStateMixin {
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
        leading: const VicBackButton(),
        title: PreferredSize(
          preferredSize: const Size.fromHeight(24),
          child: TabBar(
            indicatorColor: Colors.transparent,
            controller: controller,
            dividerHeight: 0,
            labelPadding: const EdgeInsets.all(0),
            tabs: [
              Tab(text: "records.topup.title".tr),
              Tab(text: "records.withdraw.title".tr),
            ],
          ),
        ),
        actions: [const VicCustomerService()],
      ),
      body: SafeArea(
        child: TabBarView(
          controller: controller,
          children: [
            const VicAutoKeepAlive(child: VicDepositHistory()),
            const VicAutoKeepAlive(child: VicWithdrawalHistory()),
          ],
        ),
      ),
    );
  }
}
