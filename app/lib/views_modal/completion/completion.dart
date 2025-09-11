import 'dart:developer';

import 'package:app/apis/apis.dart';
import 'package:app/extensions/bot_toast.dart';
import 'package:app/hooks/useForm.dart';
import 'package:app/iconfont/index.dart';
import 'package:app/models/announcement.model.dart';
import 'package:app/services/index.dart';
import 'package:app/views_modal/base_modal/base_modal.dart';
import 'package:app/theme/index.dart';
import 'package:app/widgets/button/index.dart';
import 'package:app/widgets/input_email/input_email.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app/widgets/input_mobile/input_mobile.dart';

class CompletionModal extends StatefulWidget {
  const CompletionModal({super.key});

  @override
  _CompletionModalState createState() => _CompletionModalState();
}

class _CompletionModalState extends State<CompletionModal> {
  List<AnnouncementModel> get announcements => services.app.announcements;
  final actives = <int>[];
  final border = Border(bottom: BorderSide(color: AppColors.background, width: 1));
  final form = Useform((values) async {
    inspect(values);
    final List<Future> tasks = [apis.user.bindMobile(payload: values)];
    if ((values['email'] as String?)?.isNotEmpty == true) {
      tasks.add(apis.user.bindEmail(payload: values));
    }

    await Future.wait(tasks);
    await showSuccess();
    Get.back();
  });

  @override
  Widget build(BuildContext context) {
    return BaseModal(
      canPop: false,
      backgroundColor: Colors.transparent,
      padding: EdgeInsets.all(0),
      // margin: 12,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildTitle(),
          Container(
            padding: Gutter.all.large,
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
                  AKMobileInput(onSaved: form.saveAs('mobile')),
                  Text('complete.email'.tr),
                  AKEmailInput(optional: true, onSaved: form.saveAs('email')),
                  AKButton(onPressed: form.submit, minWidth: double.infinity, height: 128 / 2, text: 'complete.button'.tr),
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
      margin: EdgeInsets.symmetric(horizontal: 4),
      alignment: Alignment(0, 0),
      decoration: BoxDecoration(
        color: AppColors.highlight,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
      ),
      child: Text(
        'complete.title'.tr,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}
