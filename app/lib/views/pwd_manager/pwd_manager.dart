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
  late final Useform form;
  final ctrl = TextEditingController();
  final hasPass = services.user.userInfo.value?.hasPass == 1;

  @override
  void initState() {
    form = Useform((values) async {
      try {
        BotToast.showLoading();
        await (hasPass ? apis.user.changePwd(data: values) : apis.user.bindPwd(data: values));
        BotToast.closeAllLoading();
        await showSuccess();
        services.user.queryUserInfo();
        Get.back();
      } catch (e) {
        BotToast.closeAllLoading();
        rethrow;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: form.key,
      child: Scaffold(
        appBar: AppBar(
          leading: AKBackButton(),
          title: Text((hasPass ? "acc.password.change" : "acc.password.set").tr),
          actionsPadding: EdgeInsets.only(right: 12),
          actions: [CustomerService()],
        ),
        body: SafeArea(
          child: Padding(
            padding: Gutter.all.normal,
            child: Column(
              spacing: 8,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (hasPass) AKPwdInput(onSaved: form.saveAs('old_password'), placeholder: 'form.pwd.old'.tr, backgroundColor: AppColors.white),

                AKPwdInput(controller: ctrl, onSaved: form.saveAs('new_password'), backgroundColor: AppColors.white),

                AKPwdInput(reference: ctrl, backgroundColor: AppColors.white),

                SizedBox(height: 8),

                AKButton(onPressed: form.submit, text: hasPass ? 'app.change'.tr : 'app.bind'.tr),
              ],
            ),
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
