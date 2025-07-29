import 'package:flutter/cupertino.dart';

import '../../widgets/webview.dart';
import 'package:flutter/material.dart';

class CustomerServiceView extends StatelessWidget {
  const CustomerServiceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        backgroundColor: Colors.white,
        middle: Text("在线客服"),
        automaticallyImplyLeading: true,
        previousPageTitle: "返回",
      ),
      body: WebviewView(
        "https://www.chatfun666.com/chat/serverLogin?initializeType=server&serverNo=sc770014224833410902844454240023&companyId=mg888&memberId=&memberName=&language=km",
      ),
    );
  }
}
