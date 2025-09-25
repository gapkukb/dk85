import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:victory/components/keep_alive_wrapper/keep_alive_wrapper.dart';
import 'package:victory/shared/balance_card/balance_card.dart';
import 'package:victory/theme/colors.dart';
import 'package:victory/pages/funds/widgets/deposit_channels.dart';
import 'package:victory/pages/funds/widgets/funds_menu_group.dart';
import 'package:victory/pages/funds/widgets/withdrawal_channels.dart';
import 'package:victory/pages/funds/index.dart';

class FundsPage extends StatefulWidget {
  const FundsPage({super.key});

  @override
  State<FundsPage> createState() => _FundsPageState();
}

class _FundsPageState extends State<FundsPage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const _FundsViewGetX();
  }
}

class _FundsViewGetX extends GetView<FundsController> {
  const _FundsViewGetX({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FundsController>(
      init: FundsController(),
      id: "funds",
      builder: (_) {
        const tabbarHeight = 48.0;
        final controller = Get.put(FundsController(), permanent: true);
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(300 + tabbarHeight),
            child: AppBar(
              backgroundColor: AppColors.white,
              title: Text("funds.title".tr),
              titleTextStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.title),
              flexibleSpace: const FlexibleSpaceBar(
                titlePadding: EdgeInsets.all(0),
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    VicBalanceCard(),
                    VicFundMenuGroup(),
                    SizedBox(height: tabbarHeight),
                  ],
                ),
              ),
              bottom: buildTabbar(),
            ),
          ),
          body: TabBarView(
            controller: controller.tab,
            children: [
              const VicAutoKeepAlive(child: VicDepositChannels()),
              const VicAutoKeepAlive(child: VicWithdrawalChannels()),
            ],
          ),
        );
      },
    );
  }

  TabBar buildTabbar() {
    return TabBar(
      controller: controller.tab,
      dividerColor: const Color.fromRGBO(165, 175, 182, 0.2),
      labelStyle: const TextStyle(fontWeight: FontWeight.bold),
      unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
      indicator: const BoxDecoration(
        border: Border(bottom: BorderSide(width: 2, color: AppColors.highlight)),
      ),
      // indicatorPadding: EdgeInsets.symmetric(horizontal: 16),
      // indicatorSize: TabBarIndicatorSize.tab,
      tabs: [
        Tab(
          // text: 'app.deposit'.tr,
          child: Text('app.deposit'.tr),
        ),
        Tab(text: 'app.withdraw'.tr),
      ],
    );
  }
}
