import 'package:app/modal_views/guide/guide.dart';
import 'package:app/theme/index.dart';
import 'package:app/views/fishing/fishing_view.dart';
import 'package:app/views/hot/index.dart';
import 'package:app/views/poker/poker_view.dart';
import 'package:app/views/slots/slots_view.dart';
import 'package:app/widgets/rounded_tab_indicator.dart';
import 'package:flutter/material.dart';
import './main_header.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return DefaultTabController(
      length: tabs.length,
      child: DecoratedBox(
        decoration: BoxDecoration(
          // color: Colors.amber,
          image: DecorationImage(alignment: Alignment.topCenter, image: AssetImage("assets/images/main-bg.webp"), fit: BoxFit.fitWidth),
        ),
        child: Scaffold(
          // extendBody: true,
          // extendBodyBehindAppBar: true,
          backgroundColor: Colors.transparent,
          appBar: MainViewHeader(),
          body: TabBarView(children: [HotView(), SlotsView(), FishingView(), PokerView()]),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  buildTabbar() {
    return TabBar(
      labelStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
      unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
      dividerHeight: 0,
      indicatorWeight: 0,
      labelColor: Colors.white,
      indicator: RoundedTabIndicator(height: 20, color: AppColors.primary, bottom: 3),
      tabs: [...tabs.map((tab) => Tab(height: 56, icon: Image.asset(tab.iconPath, width: 32, height: 32), text: tab.name))],
    );
  }
}
