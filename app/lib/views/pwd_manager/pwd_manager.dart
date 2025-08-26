import 'package:app/hooks/useForm.dart';
import 'package:app/shared/customer_service/customer_service.dart';
import 'package:app/theme/index.dart';
import 'package:app/widgets/back_button/back_button.dart';
import 'package:app/widgets/button/index.dart';
import 'package:app/widgets/input_mobile/input_mobile.dart';
import 'package:app/widgets/input_password/input_password.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class PwdManagerView extends StatefulWidget {
  const PwdManagerView({super.key});

  @override
  _PwdManagerState createState() => _PwdManagerState();
}

class _PwdManagerState extends State<PwdManagerView> {
  final form = Useform((values) {});
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
              if (!settled)
                AKPwdInput(
                  onSaved: form.saveAs('c'),
                  placeholder: 'form.pwd.old'.tr,
                ),
              AKPwdInput(controller: ctrl, onSaved: form.saveAs('a')),
              AKPwdInput(reference: ctrl, onSaved: form.saveAs('b')),
              SizedBox(height: 24),

              AKButton(
                onPressed: CustomerService.call,
                text: settled ? 'pwd.change'.tr : 'pwd.change'.tr,
              ),
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
