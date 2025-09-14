import 'package:app/apis/apis.dart';
import 'package:app/http/index.dart';
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

  @override
  void initState() {
    queryDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: AKBackButton(), title: Text('act.detail'.tr)),
      // body: loadingView(),
      body: loading
          ? loadingView()
          : details == null
          ? StateBlock()
          : Webview(content: details!, showScorllbar: false),
    );
  }

  Widget loadingView() {
    return Skeletonizer(child: ListView(children: [Text(BoneMock.title), Text(BoneMock.words(100)), Bone.square(size: 200)]));
  }

  queryDetails() async {
    final r = await http.get(Get.arguments as String)().whenComplete(() {
      loading = false;
      setState(() {});
    });

    if (r is Map && r['data'] is Map) {
      details = r['data']['mobile_content'];
      if (details!.isNotEmpty) {
        details = toHtml(details!);
      }
    }
  }

  String toHtml(String content) {
    return '''
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta
      name="viewport"
      content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"
    />
    <style>
      * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
      }
      ::-webkit-scrollbar {
        scrollbar-color: #ff5800 #ff5800; /* Sets the color of the scroll thumb and track */
        scrollbar-width: thin; /* Sets the width of the scrollbar */
      }
      body{padding:3.2vw;}
    </style>
  </head>
  <body>$content</body>
</html>

''';
  }
}
