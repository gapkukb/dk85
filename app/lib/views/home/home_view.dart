import 'package:app/modal_manager/modal_manager.dart';
import 'package:app/modal_manager/test.dart';
import 'package:app/theme/index.dart';
import 'package:app/views/funds/funds_view.dart';
import 'package:app/views/me/me_view.dart';
import 'package:app/views/promos/promos.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app/services/index.dart';
import 'package:app/views/main/main_view.dart';
import 'package:move_to_back/move_to_back.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final appService = AppService.to;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (appService.currentIndex.value == 0) {
          MoveToBack.execute();
        } else {
          appService.toHomeView();
        }
      },
      child: Scaffold(
        body: Obx(
          () => IndexedStack(
            index: appService.currentIndex.value,
            children: [MainView(), PromosView(), FundsView(), MeView()],
          ),
        ),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            selectedItemColor: AppColors.primary,
            backgroundColor: Colors.white.withAlpha(240),
            iconSize: 22,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            currentIndex: appService.currentIndex.value,
            onTap: appService.toView,
            items: appService.tabs,
            unselectedFontSize: 10,
            selectedFontSize: 10,
            unselectedItemColor: AppColors.label,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Get.toNamed('/login');
          },
        ),
      ),
    );
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      modalTest();
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
