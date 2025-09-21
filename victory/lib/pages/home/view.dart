import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../components/button/button.dart';
import '../../routes/app_pages.dart';
import '../../services/services.dart';
import '../../shared/locale/locale.dart';
import '../../shared/user_meta/user_meta.dart';
import '../../styles/size.dart';
import '../../styles/styles.dart';
import '../customer_service/customer_service.dart';
import '../fishing/index.dart';
import '../hot/view.dart';
import '../poker/view.dart';
import '../slots/index.dart';
import 'index.dart';
import 'widgets/home_tab_bar.dart';
import '../../iconfont/iconfont.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const _HomeViewGetX();
  }
}

class _HomeViewGetX extends GetView<HomeController> {
  const _HomeViewGetX({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: GetBuilder<HomeController>(
        init: HomeController(),
        id: "home",
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
              toolbarHeight: 56,
              // backgroundColor: AppColor.danger,
              titleSpacing: AppSize.size_12,
              title: const UserMeta(),
              actions: [
                VicButton(
                  size: 36,
                  padding: 0,
                  rounded: true,
                  backgroundColor: AppColor.white,
                  color: AppColor.highlight,
                  iconColor: AppColor.highlight,
                  iconData: IconFont.sousuo,
                  onPressed: () => Get.toNamed(AppRoutes.search),
                ),
                const SizedBox(
                  width: AppSize.size_8,
                ),
                const LocalePicker(),
                const SizedBox(
                  width: AppSize.size_8,
                ),
                const CustomerService(),
              ],
              bottom: const HomeTabBar(),
            ),
            body: const SafeArea(
              child: TabBarView(children: [HotPage(), SlotsPage(), FishingPage(), PokerPage()]),
            ),
          );
        },
      ),
    );
  }
}
