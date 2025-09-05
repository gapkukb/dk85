import 'package:app/apis/apis.dart';
import 'package:app/extensions/bot_toast.dart';
import 'package:app/hooks/useForm.dart';
import 'package:app/services/index.dart';
import 'package:app/shared/customer_service/customer_service.dart';
import 'package:app/theme/index.dart';
import 'package:app/widgets/back_button/back_button.dart';
import 'package:app/widgets/button/index.dart';
import 'package:app/widgets/input_password/input_password.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PwdManagerView extends StatefulWidget {
  const PwdManagerView({super.key});

  @override
  _PwdManagerState createState() => _PwdManagerState();
}

class _PwdManagerState extends State<PwdManagerView> {
  final form = Useform((values) async {
    try {
      BotToast.showLoading();
      await apis.user.changePwd(data: values);
      BotToast.closeAllLoading();
      await showSuccess(text: '修改密码成功');
      Get.back();
    } catch (e) {
      BotToast.closeAllLoading();
    }
  });
  final ctrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final settled = true;

    return Form(
      key: form.key,
      child: Scaffold(
        appBar: AppBar(
          leading: AKBackButton(),
          title: Text(settled ? "Change Password" : "Set Password"),
          actionsPadding: EdgeInsets.only(right: 12),
          actions: [CustomerService()],
        ),
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.all(12),
            children: [
              if (settled) AKPwdInput(onSaved: form.saveAs('old_password'), placeholder: 'form.pwd.old'.tr, backgroundColor: AppColors.white),

              AKPwdInput(controller: ctrl, onSaved: form.saveAs('new_password'), backgroundColor: AppColors.white),

              AKPwdInput(reference: ctrl, backgroundColor: AppColors.white),

              SizedBox(height: 8),

              AKButton(onPressed: form.submit, text: settled ? 'pwd.change'.tr : 'pwd.change'.tr),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    ctrl.dispose();
    super.dispose();
  }
}
