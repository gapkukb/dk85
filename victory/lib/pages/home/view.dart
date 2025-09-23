import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../components/button/button.dart';
import '../../components/keep_alive_wrapper/keep_alive_wrapper.dart';
import '../../routes/app_pages.dart';
import '../../stores/stores.dart';
import '../../shared/locale/locale.dart';
import '../../shared/user_meta/user_meta.dart';
import '../../theme/size.dart';
import '../../theme/theme.dart';
import '../customer_service/customer_service.dart';
import '../fishing/index.dart';
import '../hot/view.dart';
import '../poker/view.dart';
import '../slots/index.dart';
import 'index.dart';
import 'widgets/home_tab_bar.dart';
import '../../iconfont/iconfont.dart';

class VicHomePage extends StatefulWidget {
  const VicHomePage({Key? key}) : super(key: key);

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
  const _HomeViewGetX({Key? key}) : super(key: key);

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
                  VicKeepAlive(child: VicHotPage()),
                  VicKeepAlive(child: VicSlotsPage()),
                  VicKeepAlive(child: VicFishingPage()),
                  VicKeepAlive(child: VicPokerPage()),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
