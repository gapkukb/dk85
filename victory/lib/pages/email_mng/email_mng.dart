import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../apis/apis.dart';
import '../../components/back_button/back_button.dart';
import '../../components/button/button.dart';
import '../../helper/success.dart';
import '../../hooks/useForm.dart';
import '../../models/models.dart';
import '../../shared/input_email/input_email.dart';
import '../../stores/stores.dart';
import '../../theme/theme.dart';
import '../customer_service/customer_service.dart';

class VicEmailMngPage extends StatefulWidget {
  const VicEmailMngPage({super.key});

  @override
  _EmaileState createState() => _EmaileState();
}

class _EmaileState extends State<VicEmailMngPage> {
  VicUserModel get user => stores.user.info.value;
  final form = Useform((values) async {
    await apis.user.bindEmail(data: values);
    await showSuccess();
    stores.user.queryUserInfo();
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
