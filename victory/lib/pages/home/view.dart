import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/auth_button/auth_button.dart';
import '../../services/services.dart';
import '../fishing/index.dart';
import '../hot/view.dart';
import '../poker/view.dart';
import '../slots/index.dart';
import 'index.dart';
import 'widgets/home_tab_bar.dart';

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

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("HomePage"),
    );
  }

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
              title: Obx(() => services.auth.authorized ? const VicAuthButton() : const VicAuthButton()),
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
