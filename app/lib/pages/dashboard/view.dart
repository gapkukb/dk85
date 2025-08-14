import '../../iconfont/index.dart';
import '../../routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class DashboardPage extends GetView<DashboardController> {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      builder: (_) {
        return Scaffold(
          extendBody: true, // This is crucial to extend the body behind the nav bar
          body: Navigator(key: Get.nestedKey(1), initialRoute: Routes.HOME, onGenerateRoute: controller.onGenerateRoute),
          bottomNavigationBar: Theme(
            data: ThemeData(splashColor: Colors.transparent, highlightColor: Colors.transparent),
            child: Container(
              height: 48,
              decoration: const BoxDecoration(
                border: Border(top: BorderSide(color: Colors.black12, width: 0.5)),
              ),
              child: Obx(
                () => BottomNavigationBar(
                  elevation: 0.0,
                  backgroundColor: Colors.white.withAlpha(240),
                  selectedItemColor: Colors.red,
                  unselectedItemColor: Colors.black,
                  showUnselectedLabels: true,
                  iconSize: 16,
                  currentIndex: controller.currentIndex.value,
                  selectedFontSize: 10,
                  unselectedFontSize: 10,
                  type: BottomNavigationBarType.fixed,
                  items: controller.tabs.map((tab) {
                    return BottomNavigationBarItem(icon: Icon(tab.icon), label: tab.label);
                  }).toList(),
                  onTap: controller.changePage,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
