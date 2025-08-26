import 'package:app/hooks/useForm.dart';
import 'package:app/views/auth/controller.dart';
import 'package:app/widgets/button/index.dart';
import 'package:app/widgets/input_account/input_account.dart';
import 'package:app/widgets/input_graphic/input_graphic.dart';
import 'package:app/widgets/input_mobile/input_mobile.dart';
import 'package:app/widgets/input_password/input_password.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class SignUpView extends GetView<AuthCotroller> {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    final form = Useform((values) {});

    return Form(
      key: form.key,
      child: DecoratedBox(
        decoration: BoxDecoration(color: Colors.white),
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 12),
          children: [
            AKAccInput(onSaved: form.saveAs('account')),
            AKPwdInput(
              controller: controller.pwd,
              onSaved: form.saveAs('password'),
            ),
            AKPwdInput(reference: controller.pwd),
            AKMobileInput(onSaved: form.saveAs('mobile')),
            AKGraphicInput(onSaved: form.saveAs('code')),
            AKButton(onPressed: form.submit, text: 'app.register'.tr),
          ],
        ),
      ),
    );
  }
}
