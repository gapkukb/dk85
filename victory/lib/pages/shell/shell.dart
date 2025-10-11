import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:move_to_back/move_to_back.dart';
import 'package:victory/activity/lucky_wheel/lucky_wheel.dart';
import 'package:victory/mixins/lucky_wheel.mixin.dart';
import 'package:victory/services/services.dart';
import 'package:victory/theme/theme.dart';
import 'package:victory/pages/bonus/view.dart';
import 'package:victory/pages/funds/view.dart';
import 'package:victory/pages/home/index.dart';
import 'package:victory/pages/profile/view.dart';

class VicShellView extends StatefulWidget {
  const VicShellView({super.key});

  @override
  VicShellViewState createState() => VicShellViewState();
}

class VicShellViewState extends State<VicShellView> {
  final visible = true.obs;
  final tabs = ['/home', '/user'];

  // @override
  // void initState() {
  //   WidgetsBinding.instance.addPostFrameCallback((_) {});
  //   Timer? timer;
  //   ever(
  //     services.app.currentRoute,
  //     (value) {
  //       timer?.cancel();
  //       if (value == '/') {
  //         visible.value = true;
  //       } else {
  //         timer = Timer(Durations.medium4, () {
  //           visible.value = false;
  //         });
  //       }
  //     },
  //   );
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (services.app.currentFootNavIndex.value == 0) {
          MoveToBack.execute();
        } else {
          services.app.toHomePage();
        }
      },
      child: Obx(() {
        return Offstage(
          offstage: !visible.value,
          child: Scaffold(
            body: Obx(() {
              return IndexedStack(
                index: services.app.currentFootNavIndex.value,
                children: [
                  const VicHomePage(),
                  const VicBonusPage(),
                  services.auth.authorized ? const FundsPage() : const SizedBox.shrink(),
                  services.auth.authorized ? const VicProfilePage() : const SizedBox.shrink(),
                ],
              );
            }),

            bottomNavigationBar: Obx(
              () => BottomNavigationBar(
                selectedItemColor: AppColors.primary,
                backgroundColor: Colors.white.withAlpha(240),
                iconSize: 22,
                elevation: 0,
                type: BottomNavigationBarType.fixed,
                currentIndex: services.app.currentFootNavIndex.value,
                onTap: services.app.navigateTo,
                items: services.app.footNavItems,
                unselectedFontSize: 10,
                selectedFontSize: 10,
                unselectedItemColor: AppColors.label,
              ),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
            floatingActionButton: Obx(
              () => services.user.luckyWheelDisplay.value == LuckyWheelDisplay.none ? const SizedBox.shrink() : const LuckyWheelEnter(),
            ),
          ),
        );
      }),
    );
  }
}
