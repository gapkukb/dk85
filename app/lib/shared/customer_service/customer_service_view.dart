part of 'customer_service.dart';

class CustomerServiceView extends StatefulWidget {
  const CustomerServiceView({super.key});

  @override
  _CustomerServiceViewState createState() => _CustomerServiceViewState();
}

class _CustomerServiceViewState extends State<CustomerServiceView> {
  @override
  Widget build(BuildContext context) {
    return Webview(url: 'file:///android_asset/flutter_assets/assets/html/live-chat.html');
  }
}
