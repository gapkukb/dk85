import 'package:app/apis/apis.dart';
import 'package:app/shared/webview/webview.dart';
import 'package:app/theme/index.dart';
import 'package:app/widgets/back_button/back_button.dart';
import 'package:app/widgets/state_block/state_block.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ActivityDetailView extends StatefulWidget {
  const ActivityDetailView({super.key});

  @override
  _ActivityDetailViewState createState() => _ActivityDetailViewState();
}

class _ActivityDetailViewState extends State<ActivityDetailView> {
  bool loading = true;
  String? details;
  query() async {
    final r = await apis.app.queryActivityDetail(payload: {'activity_id': 81, 'device': '1'}).whenComplete(() {
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
      appBar: AppBar(leading: AKBackButton(), title: Text('act.detail'.tr)),
      // body: loadingView(),
      body: Padding(
        padding: Gutter.page,
        child: loading
            ? loadingView()
            : (details == null || details!.isEmpty)
            ? StateBlock()
            : Webview(content: details!, showScorllbar: false),
      ),
    );
  }

  Widget loadingView() {
    return Skeletonizer(child: ListView(children: [Text(BoneMock.title), Text(BoneMock.words(100)), Bone.square(size: 200)]));
  }
}
