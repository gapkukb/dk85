import 'package:flutter/material.dart';
import '../../hooks/useForm.dart';
import '../../ui/input_password/input_password.dart';
import '../../ui/gutter/index.dart';
import '../../widgets/Button.dart';

class UpdatePasswordView extends StatefulWidget {
  const UpdatePasswordView({super.key});

  @override
  State<UpdatePasswordView> createState() => _UpdatePasswordViewState();
}

class _UpdatePasswordViewState extends State<UpdatePasswordView> {
  final form = Useform((values) {});
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("修改密码"), centerTitle: true),
      body: SafeArea(
        child: Form(
          key: form.key,
          autovalidateMode: AutovalidateMode.always,
          child: ListView(
            padding: const EdgeInsets.all(8),
            children: [
              AKPwdInput(placeholder: "请输入旧密码", onSaved: form.saveAs('oldpassword')),
              AKPwdInput(placeholder: "请输入新密码", onSaved: form.saveAs('newpassword'), controller: controller),
              AKPwdInput(placeholder: "请确认新密码", onSaved: form.saveAs('renewpassword'), reference: controller),
              const Gutter(56),
              Button(onPressed: () => form.submit(), color: Button.danger, text: "修改密码"),
            ],
          ),
        ),
      ),
    );
  }
}
