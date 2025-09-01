import 'package:app/hooks/useForm.dart';
import 'package:app/services/index.dart';
import 'package:app/shared/customer_service/customer_service.dart';
import 'package:app/theme/index.dart';
import 'package:app/views/auth/controller.dart';
import 'package:app/widgets/button/index.dart';
import 'package:app/widgets/checkbox/checkbox.dart';
import 'package:app/widgets/input_account/input_account.dart';
import 'package:app/widgets/input_graphic/input_graphic.dart';
import 'package:app/widgets/input_password/input_password.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends GetView<AuthCotroller> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final form = Useform((values) {
      return controller.action(
        text: 'Logged in',
        todo: () {
          return AuthService.to.login(values);
        },
      );
    });

    return Form(
      key: form.key,
      child: DecoratedBox(
        decoration: BoxDecoration(color: Colors.white),
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 12),
          children: [
            AKAccInput(onSaved: form.saveAs('username')),
            AKPwdInput(onSaved: form.saveAs('password')),
            AKGraphicInput(imageKey: controller.imageKey, onSaved: form.saveAs('code'), onFieldSubmitted: form.submit, onImageChange: form.saveAs('time')),
            AKButton(onPressed: form.submit, text: 'app.login'.tr),
            buildTool(),
            ...buildInstructions(),
          ],
        ),
      ),
    );
  }

  List<Widget> buildInstructions() {
    return [
      SizedBox(height: 8),
      Text(
        "login.guide.title".tr,
        style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.label),
      ),
      SizedBox(height: 8),
      Text("login.guide.desc".tr, style: TextStyle(fontSize: 12, color: AppColors.description)),
    ];
  }

  Widget buildTool() {
    return SizedBox(
      height: 48,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Obx(() => AKCheckbox(value: controller.rememberMe.value, onChanged: controller.remember)),
          TextButton(
            onPressed: CustomerService.call,
            child: Text("login.forgot".tr, style: TextStyle(fontSize: 12, color: AppColors.primary)),
          ),
        ],
      ),
    );
  }
}
