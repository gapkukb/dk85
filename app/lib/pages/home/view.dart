import '../../iconfont/index.dart';
import '../../theme/index.dart';
import '../../widgets/service_calling.dart';
import '../fishing/index.dart';
import '../foru/view.dart';
import 'widgets/home_account.dart';
import 'widgets/home_tab_bar.dart';
import '../poker/index.dart';
import '../slots/index.dart';
import '../../widgets/keep_alive_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'index.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    const items = [ForuPage(), SlotsPage(), FishingPage(), PokerPage()];
    return GetBuilder<HomeController>(
      builder: (_) {
        return DefaultTabController(
          length: items.length,
          child: Scaffold(
            // backgroundColor: const Color(0xfff5f5f5),
            body: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    // expandedHeight: 100,
                    surfaceTintColor: AppColors.background,
                    pinned: true,
                    snap: true,
                    floating: true,
                    automaticallyImplyLeading: false,
                    centerTitle: false,
                    // leadingWidth: 150,
                    titleSpacing: 12,
                    title: const HomeAccount(),
                    actionsPadding: const EdgeInsets.symmetric(horizontal: 8),
                    actions: [
                      IconButton(
                        style: IconButton.styleFrom(backgroundColor: Colors.white),
                        padding: const EdgeInsets.all(0.0),
                        icon: const Icon(IconFont.sousuo, size: 22, color: AppColors.primary),
                        onPressed: () {},
                      ),
                      IconButton(
                        style: IconButton.styleFrom(backgroundColor: Colors.white),
                        padding: const EdgeInsets.all(0.0),
                        icon: const ServiceCalling(size: 22),
                        onPressed: () {},
                      ),
                      // const SizedBox.square(dimension: 32, child: ServiceCalling(size: 22)),
                    ],
                    bottom: const HomeTabBar(),
                  ),
                ];
              },
              body: TabBarView(children: items.map((item) => KeepAliveWrapper(child: item)).toList()),
            ),
          ),
        );
      },
    );
  }
}
