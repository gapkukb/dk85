part of 'index.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final form = Useform((values) {});

    return GetBuilder<LoginController>(
      init: LoginController(),
      id: "login",
      builder: (_) {
        return Form(
          key: form.key,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const AKAccInput(),
                AKPwdInput(onSaved: form.saveAs("mobile")),
                AKGraphicInput(onSaved: form.saveAs("code")),
                Align(
                  alignment: Alignment.centerRight,
                  child: ServiceCalling(
                    child: Text(
                      "form.forgot".tr,
                      textAlign: TextAlign.end,
                      style: const TextStyle(color: AppColors.primary),
                    ),
                  ),
                ),
                const AKMobileInput(),
                Gutter.normal,
                Button(onPressed: form.submit, text: "app.login".tr, color: Button.danger),
                Gutter.normal,
                Text("login.guide.title".tr, style: const TextStyle(fontSize: 12)),
                Text("login.guide.desc".tr, style: const TextStyle(fontSize: 12, color: AppColors.description)),
              ],
            ),
          ),
        );
      },
    );
  }
}
