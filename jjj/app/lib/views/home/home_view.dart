import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app/services/app_service.dart';
import 'package:app/services/index.dart';
import 'package:app/views/index/index_view.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final tabLogic = TabsService.to;
  final appLogic = AppService.to;

  final logic = RefreshController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(title: Text("data")),
      body: Obx(
        () => IndexedStack(
          index: tabLogic.currentIndex.value,
          children: [IndexView(), IndexView(), IndexView(), IndexView()],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 48,
        child: Obx(
          () => BottomNavigationBar(
            iconSize: 18,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            currentIndex: tabLogic.currentIndex.value,
            onTap: tabLogic.toView,
            items: tabLogic.tabs,
            unselectedFontSize: 2,
            selectedFontSize: 0,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Get.toNamed('/login');
          appLogic.reloadApp();
        },
      ),
    );
  }

  @override
  void dispose() {
    logic.dispose();
    super.dispose();
  }
}
