part of 'customer_service.dart';

class CustomerServiceView extends StatefulWidget {
  const CustomerServiceView({super.key});

  @override
  _CustomerServiceViewState createState() => _CustomerServiceViewState();
}

class _CustomerServiceViewState extends State<CustomerServiceView> {
  @override
  Widget build(BuildContext context) {
    return Webview(
      url:
          "https://www.chatfun666.com/chat/serverLogin?initializeType=server&serverNo=sc770014224833410902844454240023&companyId=mg888&memberId=&memberName=&language=my",
    );
  }
}
