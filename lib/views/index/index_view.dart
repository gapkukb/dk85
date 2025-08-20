import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class IndexView extends StatefulWidget {
  const IndexView({Key? key}) : super(key: key);

  @override
  _IndexViewState createState() => _IndexViewState();
}

class _IndexViewState extends State<IndexView>
    with AutomaticKeepAliveClientMixin {
  final refresher = RefreshController();
  @override
  Widget build(BuildContext context) {
    print("IndexViewIndexViewIndexViewIndexView");
    return Scaffold(
      body: SmartRefresher(
        controller: refresher,
        child: ListView(children: [...List.generate(100, (_) => Text("data"))]),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
