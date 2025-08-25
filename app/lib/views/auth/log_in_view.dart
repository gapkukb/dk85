import 'package:app/hooks/useForm.dart';
import 'package:app/shared/customer_service/customer_service.dart';
import 'package:app/storage/index.dart';
import 'package:app/theme/index.dart';
import 'package:app/views/auth/controller.dart';
import 'package:app/widgets/button/index.dart';
import 'package:app/widgets/checkbox/checkbox.dart';
import 'package:app/widgets/input_account/input_account.dart';
import 'package:app/widgets/input_graphic/input_graphic.dart';
import 'package:app/widgets/input_password/input_password.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class LoginView extends GetView<AuthCotroller> {
  const LoginView({super.key});

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
            AKPwdInput(onSaved: form.saveAs('password')),
            AKGraphicInput(
              onSaved: form.saveAs('code'),
              onFieldSubmitted: form.submit,
            ),
            AKButton(onPressed: form.submit, text: 'fsdaf'),
            buildTool(),
            ...buildInstructions(),
          ],
        ),
      ),
    );
  }

  List<Widget> buildInstructions() {
    return [
      SizedBox(height: 16),
      Text("Login instructions", style: TextStyle(fontWeight: FontWeight.bold)),
      SizedBox(height: 16),
      Text(
        "Enter the username you used to register",
        style: TextStyle(fontSize: 12, color: AppColors.description),
      ),
    ];
  }

  Widget buildTool() {
    return SizedBox(
      height: 48,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Obx(
            () => AKCheckbox(
              value: controller.rememberMe.value,
              onChanged: controller.remember,
            ),
          ),
          TextButton(
            onPressed: CustomerServiceTrigger.call,
            child: Text(
              "Forgot Password?",
              style: TextStyle(fontSize: 12, color: AppColors.primary),
            ),
          ),
        ],
      ),
    );
  }
}
