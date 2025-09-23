import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/button/button.dart';
import '../../hooks/useForm.dart';
import '../../shared/input_account/input_account.dart';
import '../../shared/input_graphic/input_graphic.dart';
import '../../shared/input_password/input_password.dart';
import '../../theme/theme.dart';
import '../customer_service/customer_service.dart';
import 'controller.dart';

class VicLoginView extends GetView<VicAuthCotroller> {
  const VicLoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final form = Useform(controller.login);

    return Form(
      key: form.key,
      child: DecoratedBox(
        decoration: const BoxDecoration(color: Colors.white),
        child: ListView(
          padding: AppSizes.pad_x_12,
          children: [
            VicAccInput(onSaved: form.saveAs('username')),
            VicPwdInput(onSaved: form.saveAs('password')),
            VicGraphicInput(
              imageKey: controller.imageKey,
              onSaved: form.saveAs('code'),
              onFieldSubmitted: form.submit,
              onImageChange: form.saveAs('time'),
            ),
            VicButton(height: VicButtonHeight.medium, onPressed: form.submit, text: 'app.login'.tr),
            buildTool(),
            // ...buildInstructions(),
          ],
        ),
      ),
    );
  }

  List<Widget> buildInstructions() {
    return [
      const SizedBox(height: 8),
      Text(
        "auth.guide".tr,
        style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.label),
      ),
      const SizedBox(height: 8),
      Text("auth.guide.text".tr, style: const TextStyle(fontSize: 12, color: AppColors.description)),
    ];
  }

  Widget buildTool() {
    return SizedBox(
      height: 48,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Obx(() => AKCheckbox(value: controller.rememberMe.value, onChanged: controller.remember)),
          const SizedBox(),
          TextButton(
            onPressed: VicCustomerService.call,
            child: Text("auth.forgot".tr, style: const TextStyle(fontSize: 12, color: AppColors.primary)),
          ),
        ],
      ),
    );
  }
}
