part of 'customer_service.dart';

class VicCustomerServiceView extends StatefulWidget {
  const VicCustomerServiceView({super.key});

  @override
  _VicCustomerServiceViewState createState() => _VicCustomerServiceViewState();
}

class _VicCustomerServiceViewState extends State<VicCustomerServiceView> {
  @override
  Widget build(BuildContext context) {
    return VicWebview(url: "$customerServiceUrl&CUSTOM!user_id=${services.user.id}", backButton: true);
  }
}
