import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'package:victory/apis/apis.dart';
import 'package:victory/components/back_button/back_button.dart';
import 'package:victory/components/state_block/state_block.dart';
import 'package:victory/shared/webview/webview.dart';

class VicActivityPage extends StatefulWidget {
  const VicActivityPage({super.key});

  @override
  _VicActivityPageState createState() => _VicActivityPageState();
}

class _VicActivityPageState extends State<VicActivityPage> {
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
      appBar: AppBar(leading: const VicBackButton(), title: Text('act.detail'.tr)),
      // body: loadingView(),
      body: loading
          ? loadingView()
          : details == null
          ? const VicStateBlock()
          : VicWebview(content: details!, showScorllbar: false),
    );
  }

  Widget loadingView() {
    return Skeletonizer(child: ListView(children: [Text(BoneMock.title), Text(BoneMock.words(100)), const Bone.square(size: 200)]));
  }

  queryDetails() async {
    final r = await http.get(Get.arguments as String)().whenComplete(() {
      loading = false;
      setState(() {});
    });

    if (r is Map) {
      details = r['mobile_content'];
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
