import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:victory/apis/apis.dart';
import 'package:victory/components/back_button/back_button.dart';
import 'package:victory/components/button/button.dart';
import 'package:victory/hooks/useForm.dart';
import 'package:victory/models/models.dart';
import 'package:victory/shared/dialogs/dialog.dart';
import 'package:victory/shared/input_mobile/input_mobile.dart';
import 'package:victory/services/services.dart';
import 'package:victory/theme/theme.dart';
import 'package:victory/pages/customer_service/customer_service.dart';

class VicMobileMngPage extends StatefulWidget {
  const VicMobileMngPage({super.key});

  @override
  _MobileState createState() => _MobileState();
}

class _MobileState extends State<VicMobileMngPage> {
  VicUserModel get user => services.user.info.value;
  late final Useform form;

  @override
  void initState() {
    form = Useform((values) async {
      await apis.user.bindMobile(data: values);
      VicDialog.success();
      services.user.queryUserInfo();
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: const VicBackButton(), title: Text("acc.mobile".tr)),
      body: user.mobile.isEmpty ? buildBindView() : buildUpdateView(),
    );
  }

  Widget buildBindView() {
    return Form(
      key: form.key,
      child: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          Text("acc.mobile.bind".tr, style: const TextStyle(fontSize: 12, color: AppColors.label)),
          const SizedBox(height: 16),

          Text(
            user.mobile,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.title),
          ),

          VicMobileInput(onSaved: form.saveAs('mobile'), backgroundColor: Colors.white),
          const SizedBox(height: 16),
          VicButton(onPressed: form.submit, text: 'app.bind'.tr),
        ],
      ),
    );
  }

  Widget buildUpdateView() {
    return ListView(
      padding: const EdgeInsets.all(12),
      children: [
        Text("acc.mobile.is".tr, style: const TextStyle(fontSize: 12, color: AppColors.label)),

        const SizedBox(height: 8),

        Text(
          user.mobile,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.title),
        ),

        const SizedBox(height: 24),

        VicButton(onPressed: VicCustomerService.call, text: 'app.change'.tr),
      ],
    );
  }
}
