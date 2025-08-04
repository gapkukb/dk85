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
    const items = [ForuPage(), SlotsPage(), FishingPage(), PokerPage(), ForuPage()];
    return GetBuilder<HomeController>(
      builder: (_) {
        return DefaultTabController(
          length: items.length,
          child: Scaffold(
            backgroundColor: const Color(0xfff5f5f5),
            appBar: AppBar(
              automaticallyImplyLeading: false,
              centerTitle: false,
              leadingWidth: 150,
              titleSpacing: 0,
              title: const SizedBox(height: 32, child: HomeAccount()),
              actionsPadding: const EdgeInsets.symmetric(horizontal: 8),
              actions: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 4,
                  children: [
                    const SizedBox.square(dimension: 32, child: ServiceCalling(size: 22)),

                    SizedBox.square(
                      dimension: 32,
                      child: IconButton(padding: const EdgeInsets.all(0.0), icon: const Icon(Icons.search), onPressed: () {}),
                    ),
                    SizedBox(
                      height: 24,
                      child: FilledButton.tonal(
                        style: FilledButton.styleFrom(backgroundColor: const Color(0xffff5800), padding: const EdgeInsets.all(0)),
                        onPressed: () {},
                        child: const Text(
                          "充值",
                          style: TextStyle(fontSize: 10, color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 24,
                      child: FilledButton.tonal(
                        style: FilledButton.styleFrom(backgroundColor: const Color(0xffff976a)),
                        onPressed: () {},
                        child: const Text(
                          "提款",
                          style: TextStyle(fontSize: 10, color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
              bottom: const HomeTabBar(),
            ),
            body: TabBarView(children: items.map((item) => KeepAliveWrapper(child: item)).toList()),
          ),
        );
      },
    );
  }
}
