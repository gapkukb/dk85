import '../../widgets/webview.dart';
import 'package:flutter/material.dart';

class CustomerServiceView extends StatelessWidget {
  const CustomerServiceView({super.key});

  @override
  Widget build(BuildContext context) {
    return const WebviewView(
      "https://www.chatfun666.com/chat/serverLogin?initializeType=server&serverNo=sc770014224833410902844454240023&companyId=mg888&memberId=&memberName=&language=km",
    );
  }
}
