import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:victory/components/button/button.dart';
import 'package:victory/hooks/useForm.dart';
import 'package:victory/shared/input_account/input_account.dart';
import 'package:victory/shared/input_graphic/input_graphic.dart';
import 'package:victory/shared/input_password/input_password.dart';
import 'package:victory/shared/input_mobile/input_mobile.dart';
import 'package:victory/pages/auth/controller.dart';

class VicSignUpView extends GetView<VicAuthCotroller> {
  const VicSignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    final form = Useform(controller.register);

    return Form(
      key: form.key,
      child: DecoratedBox(
        decoration: const BoxDecoration(color: Colors.white),
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          children: [
            VicAccInput(onSaved: form.saveAs('username')),
            VicPwdInput(controller: controller.pwd, onSaved: form.saveAs('password')),
            VicPwdInput(reference: controller.pwd),
            VicMobileInput(onSaved: form.saveAs('mobile')),
            VicGraphicInput(onSaved: form.saveAs('code'), onFieldSubmitted: form.submit, onImageChange: form.saveAs('time')),
            VicButton(height: VicButtonHeight.medium, onPressed: form.submit, text: 'app.register'.tr),
          ],
        ),
      ),
    );
  }
}
