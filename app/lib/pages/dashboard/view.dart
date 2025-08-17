import 'package:bot_toast/bot_toast.dart';

import '../../iconfont/index.dart';
import '../../routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared/android_back/android_back.dart';
import 'index.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      builder: (_) {
        return PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, result) {
            if (didPop) {
              AndroidBack.back();
            } else {
              BotToast.showText(text: "app.exit".tr);
            }
          },

          child: Scaffold(
            extendBody: true, // This is crucial to extend the body behind the nav bar
            body: Navigator(key: Get.nestedKey(1), initialRoute: Routes.home, onGenerateRoute: controller.onGenerateRoute),
            bottomNavigationBar: Theme(
              data: ThemeData(splashColor: Colors.transparent, highlightColor: Colors.transparent),
              child: Container(
                height: 64,
                decoration: const BoxDecoration(
                  border: Border(top: BorderSide(color: Colors.black12, width: 0.5)),
                ),
                child: Obx(() => buildBottom()),
              ),
            ),
          ),
        );
      },
    );
  }

  buildBottom() {
    return BottomNavigationBar(
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
    );
  }
}
