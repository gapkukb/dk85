import 'package:app/apis/apis.dart';
import 'package:app/extensions/bot_toast.dart';
import 'package:app/hooks/useForm.dart';
import 'package:app/models/user_info.model.dart';
import 'package:app/services/index.dart';
import 'package:app/shared/customer_service/customer_service.dart';
import 'package:app/theme/index.dart';
import 'package:app/widgets/back_button/back_button.dart';
import 'package:app/widgets/button/index.dart';
import 'package:app/widgets/input_email/input_email.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailView extends StatefulWidget {
  const EmailView({super.key});

  @override
  _EmaileState createState() => _EmaileState();
}

class _EmaileState extends State<EmailView> {
  UserModel get user => services.user.userInfo.value!;
  final form = Useform((values) async {
    await apis.user.bindEmail(data: values);
    await showSuccess();
    services.user.queryUserInfo();
    Get.back();
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: form.key,
      child: Scaffold(
        appBar: AppBar(leading: AKBackButton(), title: Text("acc.email".tr)),
        body: user.email.isEmpty ? buildBindView() : buildUpdateView(),
      ),
    );
  }

  Widget buildBindView() {
    return ListView(
      padding: EdgeInsets.all(12),
      children: [
        Text("acc.email.bind".tr, style: TextStyle(fontSize: 12, color: AppColors.label)),
        SizedBox(height: 16),
        AKEmailInput(backgroundColor: Colors.white, onSaved: form.saveAs('email')),
        SizedBox(height: 16),
        AKButton(onPressed: form.submit, text: 'app.bind'.tr),
      ],
    );
  }

  Widget buildUpdateView() {
    return ListView(
      padding: EdgeInsets.all(12),
      children: [
        Text("acc.email.is".tr, style: TextStyle(fontSize: 12, color: AppColors.label)),

        SizedBox(height: 8),

        Text(
          user.email,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.title),
        ),

        SizedBox(height: 24),

        AKButton(onPressed: CustomerService.call, text: 'app.change'.tr),
      ],
    );
  }
}
