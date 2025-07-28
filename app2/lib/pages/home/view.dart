import 'package:app2/pages/fishing/index.dart';
import 'package:app2/pages/foru/view.dart';
import 'package:app2/pages/home/widgets/home_tab_bar.dart';
import 'package:app2/pages/poker/index.dart';
import 'package:app2/pages/slots/index.dart';
import 'package:app2/widgets/keep_alive_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'index.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const items = [
      ForuPage(),
      SlotsPage(),
      FishingPage(),
      PokerPage(),
      ForuPage(),
    ];
    return DefaultTabController(
      length: items.length,
      child: Scaffold(
        backgroundColor: Color(0xfff5f5f5),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          titleSpacing: 8,
          title: SizedBox(
            height: 32,
            child: FilledButton.tonal(
              style: FilledButton.styleFrom(backgroundColor: Color(0xffff5800)),
              onPressed: () {},
              child: Text(
                "登录 | 注册",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),

          actionsPadding: EdgeInsets.symmetric(horizontal: 8),
          actions: [
            Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 4,
              children: [
                SizedBox.square(
                  dimension: 32,
                  child: IconButton(
                    padding: EdgeInsets.all(0.0),
                    icon: Icon(Icons.support_agent),
                    onPressed: () {},
                  ),
                ),

                SizedBox.square(
                  dimension: 32,
                  child: IconButton(
                    padding: EdgeInsets.all(0.0),
                    icon: Icon(Icons.search),
                    onPressed: () {},
                  ),
                ),
                SizedBox(
                  height: 24,
                  child: FilledButton.tonal(
                    style: FilledButton.styleFrom(
                      backgroundColor: Color(0xffff5800),
                      padding: EdgeInsets.all(0),
                    ),
                    onPressed: () {},
                    child: Text(
                      "充值",
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 24,
                  child: FilledButton.tonal(
                    style: FilledButton.styleFrom(
                      backgroundColor: Color(0xffff976a),
                    ),
                    onPressed: () {},
                    child: Text(
                      "提款",
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
          bottom: HomeTabBar(),
        ),
        body: TabBarView(
          children: items.map((item) => KeepAliveWrapper(child: item)).toList(),
        ),
      ),
    );
  }
}
