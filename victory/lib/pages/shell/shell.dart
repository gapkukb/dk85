import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:move_to_back/move_to_back.dart';
import '../../env.dart';
import '../../routes/app_pages.dart';
import '../../stores/stores.dart';
import '../../theme/theme.dart';
import '../bonus/view.dart';
import '../funds/view.dart';
import '../home/index.dart';
import '../profile/view.dart';

class VicShellView extends StatefulWidget {
  const VicShellView({super.key});

  @override
  _VicShellViewState createState() => _VicShellViewState();
}

class _VicShellViewState extends State<VicShellView> {
  int _currentIndex = 0;

  final tabs = ['/home', '/user'];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (stores.app.currentFootNavIndex == 0) {
          MoveToBack.execute();
        } else {
          stores.app.toHomePage();
        }
      },
      child: Scaffold(
        body: Obx(() {
          return IndexedStack(
            index: stores.app.currentFootNavIndex.value,
            children: [
              const VicHomePage(),
              const VicBonusPage(),
              stores.auth.authorized ? const FundsPage() : const SizedBox.shrink(),
              stores.auth.authorized ? const VicProfilePage() : const SizedBox.shrink(),
            ],
          );
        }),
        floatingActionButton: Environment.isDev
            ? null
            : FloatingActionButton(
                onPressed: () {
                  // showSuccess();
                  Get.toNamed(AppRoutes.demo);
                },
              ),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            selectedItemColor: AppColors.primary,
            backgroundColor: Colors.white.withAlpha(240),
            iconSize: 22,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            currentIndex: stores.app.currentFootNavIndex.value,
            onTap: stores.app.navigateTo,
            items: stores.app.footNavItems,
            unselectedFontSize: 10,
            selectedFontSize: 10,
            unselectedItemColor: AppColors.label,
          ),
        ),
      ),
    );
  }
}
