import 'package:app/apis/apis.dart';
import 'package:app/theme/index.dart';
import 'package:app/widgets/back_button/back_button.dart';
import 'package:app/widgets/loading/loading.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:flutter_html/flutter_html.dart';

class ActivityDetailView extends StatefulWidget {
  const ActivityDetailView({super.key});

  @override
  _ActivityDetailViewState createState() => _ActivityDetailViewState();
}

class _ActivityDetailViewState extends State<ActivityDetailView> {
  bool loading = true;
  late final String details;
  query() async {
    final r = await apis.app.queryActivityDetail(payload: {'activity_id': '81', 'device': '1'}).whenComplete(() {
      loading = false;
    });
    details = r.data['pc_content'] ?? '';
    setState(() {});
  }

  @override
  void initState() {
    query();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: AKBackButton(), title: Text('详情')),
      body: loading
          ? Center(child: loadingWidget)
          : SafeArea(
              child: SingleChildScrollView(child: Html(data: details)),
            ),
    );
  }
}
