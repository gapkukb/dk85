import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:victory/components/button/button.dart';
import 'package:victory/components/keep_alive_wrapper/keep_alive_wrapper.dart';
import 'package:victory/routes/app_pages.dart';
import 'package:victory/services/services.dart';
import 'package:victory/shared/locale/locale.dart';
import 'package:victory/shared/user_meta/user_meta.dart';
import 'package:victory/theme/size.dart';
import 'package:victory/theme/theme.dart';
import 'package:victory/pages/customer_service/customer_service.dart';
import 'package:victory/pages/fishing/index.dart';
import 'package:victory/pages/hot/view.dart';
import 'package:victory/pages/poker/view.dart';
import 'package:victory/pages/slots/index.dart';
import 'package:victory/pages/home/index.dart';
import 'package:victory/pages/home/widgets/home_tab_bar.dart';
import 'package:victory/iconfont/iconfont.dart';

class VicHomePage extends StatefulWidget {
  const VicHomePage({super.key});

  @override
  State<VicHomePage> createState() => _VicHomePageState();
}

class _VicHomePageState extends State<VicHomePage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const _HomeViewGetX();
  }
}

class _HomeViewGetX extends GetView<VicHomeController> {
  const _HomeViewGetX({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: GetBuilder<VicHomeController>(
        init: VicHomeController(),
        id: "home",
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
              toolbarHeight: 56,
              // backgroundColor: AppColor.danger,
              titleSpacing: AppSizes.size_12,
              title: const VicUserMeta(),
              actions: [
                VicButton(
                  size: 36,
                  padding: 0,
                  rounded: true,
                  backgroundColor: AppColors.white,
                  color: AppColors.highlight,
                  iconColor: AppColors.highlight,
                  iconData: IconFont.sousuo,
                  onPressed: () => Get.toNamed(AppRoutes.search),
                ),
                const SizedBox(
                  width: AppSizes.size_8,
                ),
                const LocalePicker(),
                const SizedBox(
                  width: AppSizes.size_8,
                ),
                const VicCustomerService(),
              ],
              bottom: const HomeTabBar(),
            ),
            body: const SafeArea(
              child: TabBarView(
                children: [
                  VicAutoKeepAlive(child: VicHotPage()),
                  VicAutoKeepAlive(child: VicSlotsPage()),
                  VicAutoKeepAlive(child: VicFishingPage()),
                  VicAutoKeepAlive(child: VicPokerPage()),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
