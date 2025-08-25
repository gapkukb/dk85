import 'package:app/shared/customer_service/customer_service.dart';
import 'package:app/theme/index.dart';
import 'package:app/widgets/back_button/back_button.dart';
import 'package:app/widgets/button/index.dart';
import 'package:app/widgets/input_mobile/input_mobile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailView extends StatefulWidget {
  const EmailView({super.key});

  @override
  _EmaileState createState() => _EmaileState();
}

class _EmaileState extends State<EmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: AKBackButton(), title: Text("Email")),
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
          "You Email Address Is",
          style: TextStyle(fontSize: 12, color: AppColors.label),
        ),

        SizedBox(height: 8),

        Text(
          "test@***.com",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.title,
          ),
        ),

        SizedBox(height: 24),

        AKButton(onPressed: CustomerServiceTrigger.call, text: 'app.change'.tr),
      ],
    );
  }
}
