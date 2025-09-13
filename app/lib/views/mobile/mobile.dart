import 'package:app/apis/apis.dart';
import 'package:app/extensions/bot_toast.dart';
import 'package:app/hooks/useForm.dart';
import 'package:app/models/user_info.model.dart';
import 'package:app/services/index.dart';
import 'package:app/shared/customer_service/customer_service.dart';
import 'package:app/theme/index.dart';
import 'package:app/widgets/back_button/back_button.dart';
import 'package:app/widgets/button/index.dart';
import 'package:app/widgets/input_mobile/input_mobile.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MobileView extends StatefulWidget {
  const MobileView({super.key});

  @override
  _MobileState createState() => _MobileState();
}

class _MobileState extends State<MobileView> {
  UserModel get user => services.user.userInfo.value!;
  final form = Useform((values) async {
    await apis.user.bindMobile(data: values);
    await showSuccess();
    services.user.queryUserInfo();
    Get.back();
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: form.key,
      child: Scaffold(
        appBar: AppBar(leading: AKBackButton(), title: Text("acc.mobile".tr)),
        body: user.mobile.isEmpty ? buildBindView() : buildUpdateView(),
      ),
    );
  }

  Widget buildBindView() {
    return ListView(
      padding: EdgeInsets.all(12),
      children: [
        Text("acc.mobile.bind".tr, style: TextStyle(fontSize: 12, color: AppColors.label)),
        SizedBox(height: 16),

        Text(
          user.mobile,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.title),
        ),

        AKMobileInput(onSaved: form.saveAs('mobile'), backgroundColor: Colors.white),
        SizedBox(height: 16),
        AKButton(onPressed: () {}, text: 'app.bind'.tr),
      ],
    );
  }

  Widget buildUpdateView() {
    return ListView(
      padding: EdgeInsets.all(12),
      children: [
        Text("acc.mobile.is".tr, style: TextStyle(fontSize: 12, color: AppColors.label)),

        SizedBox(height: 8),

        Text(
          user.mobile,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.title),
        ),

        SizedBox(height: 24),

        AKButton(onPressed: CustomerService.call, text: 'app.change'.tr),
      ],
    );
  }
}
