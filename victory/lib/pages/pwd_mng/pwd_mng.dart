import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:victory/apis/apis.dart';
import 'package:victory/components/back_button/back_button.dart';
import 'package:victory/components/button/button.dart';
import 'package:victory/hooks/useForm.dart';
import 'package:victory/shared/dialogs/dialog.dart';
import 'package:victory/shared/input_password/input_password.dart';
import 'package:victory/services/services.dart';
import 'package:victory/theme/colors.dart';
import 'package:victory/theme/size.dart';
import 'package:victory/pages/customer_service/customer_service.dart';

class VicPwdMngPage extends StatefulWidget {
  const VicPwdMngPage({super.key});

  @override
  _PwdManagerState createState() => _PwdManagerState();
}

class _PwdManagerState extends State<VicPwdMngPage> {
  late final Useform form;
  final ctrl = TextEditingController();
  final hasPass = services.user.info.value.hasPass == 1;

  @override
  void initState() {
    form = Useform((values) async {
      await (hasPass ? apis.user.changePwd(data: values) : apis.user.bindPwd(data: values));
      await VicDialog.success();
      services.user.queryUserInfo();
      Get.back();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: form.key,
      child: Scaffold(
        appBar: AppBar(
          leading: const VicBackButton(),
          title: Text((hasPass ? "acc.password.change" : "acc.password.set").tr),
          actionsPadding: const EdgeInsets.only(right: 12),
          actions: [const VicCustomerService()],
        ),
        body: SafeArea(
          child: Padding(
            padding: AppSizes.pad_page,
            child: Column(
              spacing: 8,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (hasPass) VicPwdInput(onSaved: form.saveAs('old_password'), placeholder: 'form.pwd.old'.tr, backgroundColor: AppColors.white),

                VicPwdInput(controller: ctrl, onSaved: form.saveAs('new_password'), backgroundColor: AppColors.white),

                VicPwdInput(reference: ctrl, backgroundColor: AppColors.white),

                VicButton(height: VicButtonHeight.medium, onPressed: form.submit, text: hasPass ? 'app.change'.tr : 'app.bind'.tr),
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
