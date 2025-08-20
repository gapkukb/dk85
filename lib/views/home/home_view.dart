import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jjj/services/app_service.dart';
import 'package:jjj/services/index.dart';
import 'package:jjj/views/index/index_view.dart';
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
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: tabLogic.currentIndex.value,
          onTap: tabLogic.toView,
          items: tabLogic.pages,
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
