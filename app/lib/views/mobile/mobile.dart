import 'package:app/shared/customer_service/customer_service.dart';
import 'package:app/theme/index.dart';
import 'package:app/widgets/back_button/back_button.dart';
import 'package:app/widgets/button/index.dart';
import 'package:app/widgets/input_mobile/input_mobile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MobileView extends StatefulWidget {
  const MobileView({super.key});

  @override
  _MobileState createState() => _MobileState();
}

class _MobileState extends State<MobileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: AKBackButton(), title: Text("Mobile")),
      // body: SafeArea(child: buildBindView()),
      body: SafeArea(child: buildUpdateView()),
    );
  }

  Widget buildBindView() {
    return ListView(
      padding: EdgeInsets.all(12),
      children: [
        AKMobileInput(),

        AKButton(onPressed: () {}, text: 'Bind'),
      ],
    );
  }

  Widget buildUpdateView() {
    return ListView(
      padding: EdgeInsets.all(12),
      children: [
        Text(
          "You Mobile Number Is",
          style: TextStyle(fontSize: 12, color: AppColors.label),
        ),

        SizedBox(height: 8),

        Text(
          "+95 000 *** 000",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.title,
          ),
        ),

        SizedBox(height: 24),

        AKButton(onPressed: CustomerService.call, text: 'app.change'.tr),
      ],
    );
  }
}
