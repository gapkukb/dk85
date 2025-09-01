import 'package:app/shared/account_balance/account_balance.dart';
import 'package:app/theme/index.dart';
import 'package:app/views/funds/funds_controller.dart';
import 'package:app/views/funds/widgets/funds_channels.dart';
import 'package:app/views/funds/widgets/funds_menu_group.dart';
import 'package:app/widgets/button/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FundsView extends StatefulWidget {
  const FundsView({super.key});

  @override
  _FundsViewState createState() => _FundsViewState();
}

class _FundsViewState extends State<FundsView> {
  @override
  Widget build(BuildContext context) {
    return _FundsView();
  }
}

class _FundsView extends GetView<FundsController> {
  const _FundsView({super.key});

  @override
  Widget build(BuildContext context) {
    const tabbarHeight = 48.0;
    return GetBuilder<FundsController>(
      init: FundsController(),
      id: "funds",
      builder: (_) {
        return DefaultTabController(
          length: 2,
          child: Scaffold(
            backgroundColor: AppColors.white,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(300 + tabbarHeight),
              child: AppBar(
                title: Text("page.funds".tr),
                titleTextStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.title,
                ),
                flexibleSpace: FlexibleSpaceBar(
                  titlePadding: EdgeInsets.all(0),
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AccountBalance(),
                      FundsMenuGroup(),
                      SizedBox(height: tabbarHeight),
                    ],
                  ),
                ),
                bottom: buildTabbar(),
              ),
            ),
            body: TabBarView(
              children: [FundsChannels(false), FundsChannels(true)],
            ),
          ),
        );
      },
    );
  }

  Widget buildBalance() {
    return AccountBalance(
      height: 200,
      after: Row(
        spacing: 16,
        children: [
          Flexible(
            fit: FlexFit.tight,
            child: AKButton(onPressed: () {}, text: 'DEPOSIT'),
          ),
          Flexible(
            fit: FlexFit.tight,
            child: AKButton(onPressed: () {}, text: 'DEPOSIT'),
          ),
        ],
      ),
    );
  }

  TabBar buildTabbar() {
    return TabBar(
      dividerColor: Color(0xffA5AFB6),
      labelStyle: TextStyle(fontWeight: FontWeight.bold),
      unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
      indicator: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 2, color: AppColors.highlight),
        ),
      ),
      // indicatorPadding: EdgeInsets.symmetric(horizontal: 16),
      // indicatorSize: TabBarIndicatorSize.tab,
      tabs: [
        Tab(text: 'app.deposit'.tr),
        Tab(text: 'app.withdraw'.tr),
      ],
    );
  }
}
