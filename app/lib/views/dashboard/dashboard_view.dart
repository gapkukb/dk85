import 'package:app/views/fishing/fishing_view.dart';
import 'package:app/views/hot/index.dart';
import 'package:app/views/poker/poker_view.dart';
import 'package:app/views/slots/slots_view.dart';
import 'package:flutter/material.dart';
import 'dashboard_header.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> with AutomaticKeepAliveClientMixin {
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
          appBar: DashboardHeader(),
          body: TabBarView(children: [HotView(), SlotsView(), FishingView(), PokerView()]),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
