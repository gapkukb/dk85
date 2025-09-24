import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/back_button/back_button.dart';
import '../../components/keep_alive_wrapper/keep_alive_wrapper.dart';
import '../customer_service/customer_service.dart';
import '../history_top_up/index.dart';
import '../history_withdraw/index.dart';

class HistoryPage2View extends StatefulWidget {
  const HistoryPage2View({super.key});

  @override
  _HistoryPage2ViewState createState() => _HistoryPage2ViewState();
}

class _HistoryPage2ViewState extends State<HistoryPage2View> with SingleTickerProviderStateMixin {
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
