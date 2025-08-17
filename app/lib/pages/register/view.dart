part of 'index.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    final form = Useform((values) {});

    return GetBuilder<RegisterController>(
      init: RegisterController(),
      id: "register",
      builder: (_) {
        return Form(
          key: form.key,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AKAccInput(onSaved: form.saveAs("mobile")),
                AKPwdInput(controller: controller.ctrl, onSaved: form.saveAs("mobile")),
                AKPwdInput(reference: controller.ctrl, onSaved: form.saveAs("mobile")),
                AKMobileInput(onSaved: form.saveAs("mobile")),
                AKGraphicInput(onSaved: form.saveAs("code")),
                AKButton(onPressed: form.submit, text: "app.register".tr, color: AKButton.danger),
              ],
            ),
          ),
        );
      },
    );
  }
}
