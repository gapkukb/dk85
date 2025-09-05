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
import 'package:app/widgets/input_mobile/input_mobile.dart';
import 'package:bot_toast/bot_toast.dart';
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
    services.user.queryUserInfo();
    await showSuccess(text: '绑定邮箱成功');
    Get.back();
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: form.key,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(leading: AKBackButton(), title: Text("Email")),
          body: user.email == null || user.email!.isEmpty ? buildBindView() : buildUpdateView(),
        ),
      ),
    );
  }

  Widget buildBindView() {
    return ListView(
      padding: EdgeInsets.all(12),
      children: [
        Text("Bind You Email Address", style: TextStyle(fontSize: 12, color: AppColors.label)),
        SizedBox(height: 16),
        AKEmailInput(backgroundColor: Colors.white, onSaved: form.saveAs('email')),
        SizedBox(height: 16),
        AKButton(onPressed: form.submit, text: 'Bind'),
      ],
    );
  }

  Widget buildUpdateView() {
    return ListView(
      padding: EdgeInsets.all(12),
      children: [
        Text("You Email Address Is", style: TextStyle(fontSize: 12, color: AppColors.label)),

        SizedBox(height: 8),

        Text(
          "test@***.com",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.title),
        ),

        SizedBox(height: 24),

        AKButton(onPressed: CustomerService.call, text: 'app.change'.tr),
      ],
    );
  }
}
