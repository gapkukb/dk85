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
    services.user.queryUserInfo();
    await showSuccess(text: '绑定手机号成功');
    Get.back();
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: form.key,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(leading: AKBackButton(), title: Text("Mobile")),
          body: user.mobile == null ? buildBindView() : buildUpdateView(),
        ),
      ),
    );
  }

  Widget buildBindView() {
    return ListView(
      padding: EdgeInsets.all(12),
      children: [
        Text("Bind You Mobile Number", style: TextStyle(fontSize: 12, color: AppColors.label)),
        SizedBox(height: 16),

        Text(
          "${user.mobile}",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.title),
        ),

        AKMobileInput(onSaved: form.saveAs('mobile')),
        SizedBox(height: 16),
        AKButton(onPressed: () {}, text: 'Bind'),
      ],
    );
  }

  Widget buildUpdateView() {
    return ListView(
      padding: EdgeInsets.all(12),
      children: [
        Text("You Mobile Number Is", style: TextStyle(fontSize: 12, color: AppColors.label)),

        SizedBox(height: 8),

        Text(
          "${user.mobile}",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.title),
        ),

        SizedBox(height: 24),

        AKButton(onPressed: CustomerService.call, text: 'app.change'.tr),
      ],
    );
  }
}
