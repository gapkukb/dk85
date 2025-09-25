import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:victory/apis/apis.dart';
import 'package:victory/components/back_button/back_button.dart';
import 'package:victory/components/button/button.dart';
import 'package:victory/hooks/useForm.dart';
import 'package:victory/models/models.dart';
import 'package:victory/shared/dialogs/dialog.dart';
import 'package:victory/shared/input_email/input_email.dart';
import 'package:victory/services/services.dart';
import 'package:victory/theme/theme.dart';
import 'package:victory/pages/customer_service/customer_service.dart';

class VicEmailMngPage extends StatefulWidget {
  const VicEmailMngPage({super.key});

  @override
  _EmaileState createState() => _EmaileState();
}

class _EmaileState extends State<VicEmailMngPage> {
  VicUserModel get user => services.user.info.value;
  final form = Useform((values) async {
    await apis.user.bindEmail(data: values);
    await VicDialog.success();
    services.user.queryUserInfo();
    Get.back();
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: form.key,
      child: Scaffold(
        appBar: AppBar(leading: const VicBackButton(), title: Text("acc.email".tr)),
        body: user.email.isEmpty ? buildBindView() : buildUpdateView(),
      ),
    );
  }

  Widget buildBindView() {
    return ListView(
      padding: const EdgeInsets.all(12),
      children: [
        Text("acc.email.bind".tr, style: const TextStyle(fontSize: 12, color: AppColors.label)),
        const SizedBox(height: 16),
        VicEmailInput(backgroundColor: Colors.white, onSaved: form.saveAs('email')),
        const SizedBox(height: 16),
        VicButton(onPressed: form.submit, text: 'app.bind'.tr),
      ],
    );
  }

  Widget buildUpdateView() {
    return ListView(
      padding: const EdgeInsets.all(12),
      children: [
        Text("acc.email.is".tr, style: const TextStyle(fontSize: 12, color: AppColors.label)),

        const SizedBox(height: 8),

        Text(
          user.email,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.title),
        ),

        const SizedBox(height: 24),

        VicButton(onPressed: VicCustomerService.call, text: 'app.change'.tr),
      ],
    );
  }
}
