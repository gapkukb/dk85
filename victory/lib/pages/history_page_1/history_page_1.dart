import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/back_button/back_button.dart';
import '../../components/keep_alive_wrapper/keep_alive_wrapper.dart';
import '../customer_service/customer_service.dart';
import '../history_funds/index.dart';
import '../history_games/index.dart';

class VicTransHistoryPage extends StatefulWidget {
  const VicTransHistoryPage({super.key});

  @override
  _VicTransHistoryPageState createState() => _VicTransHistoryPageState();
}

class _VicTransHistoryPageState extends State<VicTransHistoryPage> with SingleTickerProviderStateMixin {
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
              Tab(text: "records.change.title".tr),
              Tab(text: "records.game.title".tr),
            ],
          ),
        ),
        actions: [const VicCustomerService()],
      ),
      body: SafeArea(
        child: TabBarView(
          controller: controller,
          children: [
            const VicAutoKeepAlive(child: VicFundHistory()),
            const VicAutoKeepAlive(child: VicGameHistory()),
          ],
        ),
      ),
    );
  }
}
