import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:victory/apis/apis.dart';
import 'package:victory/components/button/button.dart';
import 'package:victory/hooks/useForm.dart';
import 'package:victory/shared/dialogs/dialog.dart';
import 'package:victory/shared/input_email/input_email.dart';
import 'package:victory/shared/input_mobile/input_mobile.dart';
import 'package:victory/theme/theme.dart';
import 'package:victory/modals/views/modal_template.dart';

class VicModalCompletionProfile extends StatefulWidget {
  const VicModalCompletionProfile({super.key});

  @override
  _VicModalCompletionProfileState createState() => _VicModalCompletionProfileState();
}

class _VicModalCompletionProfileState extends State<VicModalCompletionProfile> {
  final actives = <int>[];
  final border = const Border(bottom: BorderSide(color: AppColors.background, width: 1));
  final form = Useform((values) async {
    inspect(values);
    final List<Future> tasks = [apis.user.bindMobile(payload: values)];
    if ((values['email'] as String?)?.isNotEmpty == true) {
      tasks.add(apis.user.bindEmail(payload: values));
    }

    await Future.wait(tasks);
    await VicDialog.success();
    Get.back();
  });

  @override
  Widget build(BuildContext context) {
    return VicModalTemplate(
      canPop: false,
      backgroundColor: Colors.transparent,
      padding: const EdgeInsets.all(0),
      // margin: 12,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildTitle(),
          Container(
            padding: AppSizes.pad_a_24,
            width: double.infinity,
            height: 328,
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
            child: Form(
              key: form.key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8,
                children: [
                  Text('complete.mobile'.tr),
                  VicMobileInput(onSaved: form.saveAs('mobile')),
                  Text('complete.email'.tr),
                  VicEmailInput(optional: true, onSaved: form.saveAs('email')),
                  VicButton(
                    onPressed: form.submit,
                    minWidth: double.infinity,
                    height: 128 / 2,
                    text: 'complete.button'.tr,
                    fontSize: 16,
                    textBold: true,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTitle() {
    return Container(
      width: double.infinity,
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      alignment: const Alignment(0, 0),
      decoration: const BoxDecoration(
        color: AppColors.highlight,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
      ),
      child: Text(
        'complete.title'.tr,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}
