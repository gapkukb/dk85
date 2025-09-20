import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:move_to_back/move_to_back.dart';

import '../../components/action_sheet/action_sheet.dart';
import '../../components/button/button.dart';
import '../../helper/success.dart';
import '../../helper/toast.dart';
import '../../routes/app_pages.dart';
import '../../services/services.dart';
import '../../styles/styles.dart';
import '../bonus/view.dart';
import '../funds/view.dart';
import '../home/index.dart';
import '../profile/view.dart';

class ShellView extends StatefulWidget {
  const ShellView({super.key});

  @override
  _ShellViewState createState() => _ShellViewState();
}

class _ShellViewState extends State<ShellView> {
  int _currentIndex = 0;

  final tabs = ['/home', '/user'];

  @override
  void initState() {
    print('xxxxxxxxxxxxxxxxxxxxxx');
    WidgetsBinding.instance.addPostFrameCallback((_) {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (services.app.currentFootNavIndex == 0) {
          MoveToBack.execute();
        } else {
          services.app.toHomePage();
        }
      },
      child: Scaffold(
        body: Obx(() {
          return IndexedStack(
            index: services.app.currentFootNavIndex.value,
            children: [
              const HomePage(),
              const BonusPage(),
              services.auth.authorized ? const FundsPage() : const SizedBox.shrink(),
              services.auth.authorized ? const ProfilePage() : const SizedBox.shrink(),
            ],
          );
        }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // showSuccess();
            Get.toNamed(AppRoutes.demo);
          },
        ),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            selectedItemColor: AppColor.primary,
            backgroundColor: Colors.white.withAlpha(240),
            iconSize: 22,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            currentIndex: services.app.currentFootNavIndex.value,
            onTap: services.app.navigateTo,
            items: services.app.footNavItems,
            unselectedFontSize: 10,
            selectedFontSize: 10,
            unselectedItemColor: AppColor.label,
          ),
        ),
      ),
    );
  }
}
