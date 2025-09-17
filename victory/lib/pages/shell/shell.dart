import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/action_sheet/action_sheet.dart';
import '../../components/button/button.dart';
import '../../styles/styles.dart';

class ShellPage extends StatefulWidget {
  const ShellPage({super.key});

  @override
  _ShellPageState createState() => _ShellPageState();
}

class _ShellPageState extends State<ShellPage> {
  int _currentIndex = 0;

  final tabs = ['/home', '/user'];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.bottomSheet(
        VicActionSheet<int>(
          initValue: 1,
          onChanged: (value) => print(value.join(',')),
          actions: [
            VicAction(title: '操作', value: 1, onTap: (action, actions) {}),
            VicAction(title: '操作', value: 2, onTap: (action, actions) {}),
            VicAction(title: '操作', value: 3, onTap: (action, actions) {}),
            VicAction(title: '操作', value: 4, onTap: (action, actions) {}),
          ],
        ),
        isScrollControlled: true,
        enableDrag: true,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: styles.gutter.all.px12,
        children: [
          // const VicActionSheet(actions: [VicActionSheetAction()]),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.abc), label: 'home'),
          const BottomNavigationBarItem(icon: Icon(Icons.abc), label: 'home'),
        ],
        onTap: (index) {
          if (index == _currentIndex) return;
          setState(() {
            _currentIndex = index;
          });
          // 切换嵌套路由
          Get.offNamed(tabs[index], id: 1);
        },
      ),
    );
  }
}
